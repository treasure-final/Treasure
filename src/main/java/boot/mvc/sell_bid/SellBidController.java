package boot.mvc.sell_bid;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.buy_bid.BuyBidDto;
import boot.mvc.buy_bid.BuyBidService;
import boot.mvc.detail.DetailService;
import boot.mvc.item.ItemDto;
import boot.mvc.item.ItemService;
import boot.mvc.item.ItemServiceInter;
import boot.mvc.sell_now.SellNowService;
import boot.mvc.user.UserDto;
import boot.mvc.user.UserService;

@Controller
public class SellBidController {

   @Autowired
   SellBidService service;
   
   @Autowired
   UserService userService;
   
   @Autowired
   ItemService itemService;
   
   @Autowired
   BuyBidService buyBidService;
   
   @GetMapping("/sell/sellSize")
   public String sellSizeForm(Model model, @RequestParam("item_num") String item_num) {
      
      ItemDto itemDto=itemService.getItemData(item_num);
      
      model.addAttribute("itemDto", itemDto);
      model.addAttribute("item_num", item_num);
      System.out.println(item_num);
            
      return "/sell/sellSize";
   }
   
   @GetMapping("/sell/sellAgree")
   public ModelAndView sellAgreeForm(String size, Model model, @RequestParam("item_num") String item_num) {
      
      ModelAndView mview=new ModelAndView();
      
      ItemDto itemDto=itemService.getItemData(item_num);
      
      model.addAttribute("itemDto", itemDto);
      model.addAttribute("item_num", item_num);
      
      mview.addObject("size", size);
      mview.setViewName("/sell/sellAgree");   
      
      return mview;
   }
   
   @GetMapping("/sell/sellType")
   public ModelAndView sellTypeForm(String size, Model model, @RequestParam("item_num") String item_num) {

      ModelAndView mview=new ModelAndView();
      
      ItemDto itemDto=itemService.getItemData(item_num);
      
      // 즉시 판매 시 필요한 buyBidDto
      BuyBidDto buyBidDto = buyBidService.getBuyBidForSellNow(item_num, size);
      String buy_num = buyBidDto.getBuy_num();
      int sellNowPrice = Integer.parseInt(buyBidDto.getBuy_wishprice());
      
      model.addAttribute("itemDto", itemDto);
      model.addAttribute("item_num", item_num);
      
      mview.addObject("buy_num", buy_num);
      mview.addObject("sellNowPrice", sellNowPrice);
      mview.addObject("size", size);
      
      mview.setViewName("/sell/sellType");
      
      return mview;
   }
   
   @GetMapping("/sell/sellCalculate")
   public ModelAndView sellCalculateForm(HttpSession session,
		   @RequestParam String type,
		   @RequestParam(required = false) String hopePrice, 
		   @RequestParam(required = false) int totalPrice, 
		   @RequestParam(required = false) String buy_num,
		   @RequestParam String size, 
		   @RequestParam(required = false)String deadline, 
		   @RequestParam("item_num") String item_num) {
      
      ModelAndView mview=new ModelAndView();
      
      ItemDto itemDto=itemService.getItemData(item_num);
      
      String loginEmail = (String) session.getAttribute("loginEmail");
      String user_num = userService.findEmailUserNum(loginEmail);
      UserDto userDto= userService.getUserNumData(user_num);
      
      mview.addObject("itemDto", itemDto);
      mview.addObject("item_num", item_num);
      mview.addObject("userDto", userDto);
      mview.addObject("user_num", user_num);
      
      mview.addObject("type", type);
      mview.addObject("hopePrice", hopePrice);
      mview.addObject("totalPrice", totalPrice);
      mview.addObject("size", size);
      mview.addObject("deadline", deadline);
      
      mview.setViewName("/sell/sellCalculate");
      
      return mview;
   }
   
   @PostMapping("/sell/insertSellBid")
   @ResponseBody
   public String insertSellBid(HttpSession session, int hopePrice, int totalPrice, String size, String deadline, String addr, String name, String phone, 
         String account1, String account2, String penaltypay1, String penaltypay2,  @RequestParam("item_num") String item_num, Model model) {
      
      String account=account1+" "+account2;
      String penaltypay=penaltypay1+" "+penaltypay2;
      String sellAddr=name+","+phone+","+addr;
      
      String loginEmail = (String) session.getAttribute("loginEmail");
      
        String user_num = userService.findEmailUserNum(loginEmail);
        userService.getUserNumData(user_num);
        
        SellBidDto sellBidDto=new SellBidDto();
        sellBidDto.setItem_num(item_num);
        sellBidDto.setUser_num(user_num);
        sellBidDto.setSell_account(account);
        sellBidDto.setSell_penaltypay(penaltypay);
        sellBidDto.setSell_addr(sellAddr);
        sellBidDto.setSell_deadline(Integer.parseInt(deadline));
        sellBidDto.setSell_wishprice(hopePrice);
        sellBidDto.setSell_totalprice(totalPrice);
        sellBidDto.setSell_size(size);
        
        
        // test_result 합격, 불합격 랜덤 부여
        String test_result = "";
        
        Random random = new Random();
        double testResult = random.nextDouble(); 

        if (testResult <= 0.05) {
           test_result = "불합격";  // 5% 확률로 불합격
        } else {
           test_result = "합격";  // 95% 확률로 합격
        }
        
        // test_result 불합격이면 sell_status 판매불가
        if(test_result.equals("불합격"))
           sellBidDto.setSell_status("판매불가");        
        else
           sellBidDto.setSell_status("판매대기"); 
        
        sellBidDto.setTest_result(test_result);
        
        service.insertSellBid(sellBidDto);

        return loginEmail;
      
   }
}  