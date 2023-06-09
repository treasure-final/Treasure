package boot.mvc.buy_now;

import boot.mvc.item.ItemDto;
import boot.mvc.item.ItemService;
import boot.mvc.order.OrderService;
import boot.mvc.sell_bid.SellBidDto;
import boot.mvc.sell_bid.SellBidService;
import boot.mvc.user.UserDto;
import boot.mvc.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class BuyNowController {

    @Autowired
    BuyNowService service;
    @Autowired
    ItemService itemService;
    @Autowired
    UserService userService;
    @Autowired
    SellBidService sellBidService;
    @Autowired
    OrderService orderService;

    //구매 사이즈 선택
    @GetMapping("/buy/select")
    public ModelAndView selectSize(@RequestParam String item_num) {
        ModelAndView mv=new ModelAndView();
        ItemDto dto=itemService.getItemData(item_num);
        List<SellBidDto> buyNowPrice=service.getBuyNowPrice(item_num);
        System.out.println(buyNowPrice.size());
//      System.out.println(item_num);

        mv.addObject("item_num",item_num);
        mv.addObject("dto",dto);
        mv.addObject("buyNowPriceDto",buyNowPrice);

        mv.setViewName("/purchase/purchaseSize");
        return mv;
    }

    //구매 동의
    @GetMapping("/buy/check")
    public ModelAndView buyAgree(String item_num, String size, String deliveryWay, String price) {
        ModelAndView mv = new ModelAndView();

        ItemDto dto=itemService.getItemData(item_num);
        mv.addObject("dto", dto);
        mv.addObject("size", size);
        mv.addObject("deliveryWay", deliveryWay);
        mv.addObject("price", price.substring(3, price.length()));
//      System.out.println(size);

        mv.setViewName("/purchase/purchaseAgree");
        return mv;
    }

    //구매입찰/즉시구매 선택
    @GetMapping("/buy/type")
    public ModelAndView selectType(String item_num, String size, String deliveryWay,String price) {
        ModelAndView mv = new ModelAndView();

        ItemDto dto=itemService.getItemData(item_num);
        mv.addObject("dto", dto);
        mv.addObject("size", size);
        mv.addObject("deliveryWay", deliveryWay);
        mv.addObject("price", price);

        mv.setViewName("/purchase/purchaseType");
        return mv;
    }

    //구매/결제
    @GetMapping("/buy/order")
    public ModelAndView buyOrder(String item_num, String price, String orderPrice,
                                 HttpSession session, String size, String deadline, String deliveryWay) {
        ModelAndView mv = new ModelAndView();
        String loginEmail = (String) session.getAttribute("loginEmail");
        String userNum = userService.findEmailUserNum(loginEmail);

        SellBidDto sellBidDto = sellBidService.getSellBidDatas(item_num);
        UserDto userDto = userService.getUserNumData(userNum);
        ItemDto dto=itemService.getItemData(item_num);
        mv.addObject("dto", dto);
        if(orderPrice!=null) {
            mv.addObject("price", orderPrice.substring(3, orderPrice.length()));
        } else {
            mv.addObject("price", price);
        }
        mv.addObject("sellPrice", sellBidDto.getSell_wishprice());
        mv.addObject("deadline", deadline);
        mv.addObject("size", size);
        mv.addObject("deliveryWay", deliveryWay);
        mv.addObject("loginEmail", loginEmail);
        mv.addObject("userName", userDto.getUser_name());
        mv.addObject("userPhone", userDto.getUser_hp());
        mv.addObject("userAddr", userDto.getUser_addr());
        mv.setViewName("/purchase/purchaseOrder");

        return mv;
    }

    @GetMapping("/buy/ordersuccess")
    public ModelAndView ordersuccess(String item_num, HttpSession session,String size) {
        ModelAndView mv=new ModelAndView();

        ItemDto dto=itemService.getItemData(item_num);
        mv.addObject("dto", dto);
        String loginEmail = (String) session.getAttribute("loginEmail");
        String userNum = userService.findEmailUserNum(loginEmail);
        UserDto userDto = userService.getUserNumData(userNum);
        mv.addObject("userName", userDto.getUser_name());
        mv.addObject("userPhone", userDto.getUser_hp());
        mv.addObject("size", size);

        mv.setViewName("/purchase/purchaseSuccess");
        return mv;
    }
}
