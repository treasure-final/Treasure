package boot.mvc.buy_now;

import boot.mvc.item.ItemDto;
import boot.mvc.item.ItemService;
import boot.mvc.order.OrderDto;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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

        if(price.contains("ONE SIZE")) {
            mv.addObject("price", price.substring(8, price.length()));
        } else if(price.contains("XXXL")) {
            mv.addObject("price", price.substring(4, price.length()));
        } else if(price.contains("XXL")) {
            mv.addObject("price", price.substring(3, price.length()));
        } else if(price.contains("XS") || price.contains("XL")) {
            mv.addObject("price", price.substring(2, price.length()));
        } else if(price.contains("S") || price.contains("M") || price.contains("L")) {
            mv.addObject("price", price.substring(1, price.length()));
        } else if(price!=null) {
            mv.addObject("price", price.substring(3, price.length()));
        }  else {
            mv.addObject("price", price);
        }
        mv.setViewName("/purchase/purchaseAgree");
        return mv;
    }

    //구매입찰/즉시구매 선택
    @GetMapping("/buy/type")
    public ModelAndView selectType(String item_num, String size, String deliveryWay, String price) {
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
    public ModelAndView buyOrder(String item_num, String orderPrice, String price,
                                 HttpSession session, String size, String deadline, String deliveryWay, String buyType) {
        ModelAndView mv = new ModelAndView();
        String loginEmail = (String) session.getAttribute("loginEmail");
        String userNum = userService.findEmailUserNum(loginEmail);

        UserDto userDto = userService.getUserNumData(userNum);
        ItemDto dto=itemService.getItemData(item_num);
        mv.addObject("dto", dto);
        mv.addObject("price", price);
        mv.addObject("orderPrice", orderPrice);
        mv.addObject("deadline", deadline);
        mv.addObject("item_num", item_num);
        mv.addObject("buyType", buyType);
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
    public ModelAndView ordersuccess(String sell_num, HttpSession session,String size) {
        ModelAndView mv=new ModelAndView();

        BuyNowDto buyNowDto=service.getBuyNowData(sell_num);
        ItemDto itemDto=itemService.getItemData(buyNowDto.getItem_num());
        String orderNum=orderService.getNowinsertOrderNum();
        System.out.println("orderNum"+orderNum);
        OrderDto orderDto=orderService.getOrderData(orderNum);

        String loginEmail = (String) session.getAttribute("loginEmail");
        String userNum = userService.findEmailUserNum(loginEmail);
        UserDto userDto = userService.getUserNumData(userNum);

        if(buyNowDto.getDelivery().equals("빠른배송")) {
            int delivery=5000;
            mv.addObject("delivery",delivery);
        } else {
            int delivery=3000;
            mv.addObject("delivery",delivery);
        }

        mv.addObject("buyNowDto",buyNowDto);
        mv.addObject("orderDto",orderDto);
        mv.addObject("itemDto", itemDto);
        mv.addObject("userName", userDto.getUser_name());
        mv.addObject("userPhone", userDto.getUser_hp());
        mv.addObject("size", orderDto.getSize());

        mv.setViewName("/purchase/purchaseSuccess");
        return mv;
    }

    @PostMapping("/buy/orderproc")
    @ResponseBody
    public String orderproc(HttpSession session,
                            String item_num, String wish_price,
                            String size, String delivery,
                            String buy_addr,
                            String payment) {
        String loginEmail=(String)session.getAttribute("loginEmail");
        String user_num=userService.findEmailUserNum(loginEmail);
        List<SellBidDto> list=service.getBuyNowPrice(item_num);
        String sell_user=list.get(0).getUser_num();
        String sell_num=list.get(0).getSell_num();

//        System.out.println(item_num);
//        System.out.println(wish_price);
//        System.out.println(size);
//        System.out.println(sell_user);
//        System.out.println(sell_num);
//        System.out.println(delivery);
//        System.out.println(buy_addr);
//        System.out.println(payment);

        //buy_now에 insert
        BuyNowDto buyNowDto=new BuyNowDto();
        buyNowDto.setUser_num(user_num);
        buyNowDto.setItem_num(item_num);
        buyNowDto.setSell_num(sell_num);
        buyNowDto.setBuynow_price(Integer.parseInt(wish_price));
        if(delivery.equals("fast")){
            buyNowDto.setDelivery("빠른배송");
        }else {
            buyNowDto.setDelivery("일반배송");
        }
        buyNowDto.setBuy_addr(buy_addr);
        if(payment.equals("kakaopay")) {
            buyNowDto.setPayment("카카오페이");
        } else {
            buyNowDto.setPayment("신용카드");
        }
        buyNowDto.setBuy_status(Math.random()<0.5?0:1);
        service.insertBuyNow(buyNowDto);

        //sell_bid에서 판매상태 '판매완료'로 변경
        service.updateSellStatus(sell_num);

        //order에 insert
        OrderDto orderDto=new OrderDto();
        orderDto.setSell_user(sell_user);
        orderDto.setItem_num(item_num);
        orderDto.setBuy_user(user_num);
        orderDto.setSize(size);
        orderDto.setWish_price(Integer.parseInt(wish_price));
        orderService.insertOrder(orderDto);

        return sell_num;
    }
}