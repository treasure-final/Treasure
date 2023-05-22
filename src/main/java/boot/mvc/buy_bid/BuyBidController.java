package boot.mvc.buy_bid;

import boot.mvc.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class BuyBidController {

    @Autowired
    BuyBidService service;

    @Autowired
    UserService userService;

    @PostMapping("/buy/insertBuyBid")
    @ResponseBody
    public String insertBuyBid(HttpSession session, String price, String size, String deadline, String addr, String item_num) {
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

        return loginEmail;
    }
}