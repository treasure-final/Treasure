package boot.mvc.buy_bid;

import boot.mvc.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

@Controller
public class BuyBidController {

    @Autowired
    BuyBidService service;

    @Autowired
    UserService userService;

    @PostMapping("/buy/insertBuyBid")
    public void insertBuyBid(HttpSession session, String price, String size, String deadline, String addr) {
        String loginEmail = (String) session.getAttribute("loginEmail");
        String user_num = userService.findEmailUserNum(loginEmail);

        BuyBidDto buyBidDto = new BuyBidDto();
        buyBidDto.setItem_num("1");
        buyBidDto.setUser_num(user_num);
        buyBidDto.setBuy_wishprice(price);
        buyBidDto.setBuy_size(size);
        buyBidDto.setBuy_deadline(Integer.parseInt(deadline));
        buyBidDto.setBuy_addr(addr);

        service.insertBuyBid(buyBidDto);
    }
}