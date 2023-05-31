package boot.mvc.buy_bid;

import boot.mvc.item.ItemDto;
import boot.mvc.item.ItemService;
import boot.mvc.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class BuyBidController {

    @Autowired
    BuyBidService service;

    @Autowired
    UserService userService;

    @Autowired
    ItemService itemService;

    @PostMapping("/buy/insertBuyBid")
    @ResponseBody
    public String insertBuyBid(HttpSession session, String price, String size, String deadline, String addr, String item_num, Model model) {
        Map<String,String> map=new HashMap<>();
        String loginEmail = (String) session.getAttribute("loginEmail");
        String user_num = userService.findEmailUserNum(loginEmail);

        BuyBidDto buyBidDto = new BuyBidDto();
        buyBidDto.setItem_num(item_num);
        buyBidDto.setUser_num(user_num);
        buyBidDto.setBuy_wishprice(price);
        buyBidDto.setBuy_size(size);
        buyBidDto.setBuy_deadline(Integer.parseInt(deadline));
        buyBidDto.setBuy_addr(addr);

        service.insertBuyBid(buyBidDto);
        String buy_num=service.getNowinsertBuyBidNum();
        model.addAttribute("loginEmail",loginEmail);

        return buy_num;
    }

    @GetMapping("/buy/buybidsuccess")
    public ModelAndView buyBidSuccess(String buy_num) {
        ModelAndView mv=new ModelAndView();
        System.out.println(buy_num);
        BuyBidDto buyBidDto=service.getDataOfBuyBid(buy_num);
        ItemDto itemDto=itemService.getItemData(buyBidDto.getItem_num());
        mv.addObject("buyBidDto",buyBidDto);
        mv.addObject("itemDto",itemDto);

        mv.setViewName("/purchase/buyBidSuccess");
        return mv;
    }
}