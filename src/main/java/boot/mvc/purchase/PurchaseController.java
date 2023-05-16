package boot.mvc.purchase;

import boot.mvc.buy_bid.BuyBidDto;
import boot.mvc.item.ItemDto;
import boot.mvc.item.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class PurchaseController {

    @Autowired
    PurchaseService service;
    @Autowired
    ItemService itemService;

    //구매 사이즈 선택
    @GetMapping("/buy/select")
    public String selectSize(@RequestParam String item_num, Model model) {
        ItemDto dto=itemService.getItemData(item_num);
        model.addAttribute("item_num",item_num);
        model.addAttribute("dto",dto);
        return "/purchase/purchaseSize";
    }

    //구매 동의
    @GetMapping("/buy/check")
    public ModelAndView buyAgree(String item_num, String size, String deliveryWay) {
        ModelAndView mv = new ModelAndView();

        ItemDto dto=itemService.getItemData(item_num);
        mv.addObject("dto", dto);
        mv.addObject("size", size);
        mv.addObject("deliveryWay", deliveryWay);
//        System.out.println(size);

        mv.setViewName("/purchase/purchaseAgree");
        return mv;
    }

    //구매입찰/즉시구매 선택
    @GetMapping("/buy/type")
    public ModelAndView selectType(String item_num, String size, String deliveryWay) {
        ModelAndView mv = new ModelAndView();

        ItemDto dto=itemService.getItemData(item_num);
        mv.addObject("dto", dto);
        mv.addObject("size", size);
        mv.addObject("deliveryWay", deliveryWay);

        mv.setViewName("/purchase/purchaseType");
        return mv;
    }

    //구매/결제
    @GetMapping("/buy/order")
    public ModelAndView buyOrder(String item_num, String price, String size, String deadline, String deliveryWay) {
        ModelAndView mv = new ModelAndView();

        ItemDto dto=itemService.getItemData(item_num);
        mv.addObject("dto", dto);
        mv.addObject("price", price);
        mv.addObject("deadline", deadline);
        mv.addObject("size", size);
        mv.addObject("deliveryWay", deliveryWay);
        mv.setViewName("/purchase/purchaseOrder");
        return mv;
    }
}
