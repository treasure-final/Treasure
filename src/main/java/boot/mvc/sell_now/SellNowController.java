package boot.mvc.sell_now;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boot.mvc.buy_bid.BuyBidDto;
import boot.mvc.buy_bid.BuyBidService;
import boot.mvc.buy_now.BuyNowDto;
import boot.mvc.buy_now.BuyNowService;
import boot.mvc.order.OrderDto;
import boot.mvc.order.OrderService;
import boot.mvc.sell_total.SellTotalDto;
import boot.mvc.sell_total.SellTotalService;
import boot.mvc.user.UserService;

@Controller
public class SellNowController {

	@Autowired
	UserService userService;	
	
	@Autowired
	BuyNowService buyNowService;
	
	@Autowired 
	BuyBidService buyBidService;
	
	@Autowired
	SellNowService sellNowService;
	
	@Autowired
	SellTotalService sellTotalService;
	
	@Autowired
	OrderService orderService;
	
	@PostMapping("/sell/insertSellNow")
	@ResponseBody
	public String sellNow(@RequestParam String item_num,
			@RequestParam String buy_num,
			@RequestParam int totalPrice,
			@RequestParam String name, 
			@RequestParam String phone, 
			@RequestParam String addr, 
			@RequestParam String account1, 
			@RequestParam String account2, 
			@RequestParam String penaltypay1, 
			@RequestParam String penaltypay2,
			HttpSession session) {
		
		String loginEmail = (String) session.getAttribute("loginEmail");
	      
        String user_num = userService.findEmailUserNum(loginEmail);
        userService.getUserNumData(user_num);

        String account = account1 + " " + account2;
        String penaltypay = penaltypay1 + " " + penaltypay2;
        String sellAddr = name+"," + phone + "," +addr;
        
        SellNowDto sellNowDto = new SellNowDto();
        
        sellNowDto.setUser_num(user_num);
        sellNowDto.setItem_num(item_num);
        sellNowDto.setBuy_num(buy_num);
        sellNowDto.setSellnow_totalprice(totalPrice);
        sellNowDto.setSellnow_account(account);
        sellNowDto.setSellnow_penaltypay(penaltypay);
        sellNowDto.setSellnow_addr(sellAddr);
                
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
        if(test_result.equals("불합격")) {
        	sellNowDto.setSell_status("판매불가");      
        	sellNowDto.setTest_result(test_result);
        	
        	sellNowService.insertSellNow(sellNowDto);
        }
        else {
        	// 검수 결과가 합격이면 판매 상태 -> 판매 완료
        	sellNowDto.setSell_status("판매완료");    
        	sellNowDto.setTest_result(test_result);
        	
        	sellNowService.insertSellNow(sellNowDto);     	

        }
        
        String sellnow_num = sellNowService.getNowinsertSellNowNum();
        
        // 전체 판매 insert
        SellTotalDto sellTotalDto = new SellTotalDto();
        
        sellTotalDto.setUser_num(user_num);
        sellTotalDto.setSellnow_num(sellnow_num);        
        
        sellTotalService.insertSellNow(sellTotalDto);
 
        if(test_result.equals("합격")) {
        	// insertOrder  
        	
        	OrderDto orderDto = new OrderDto();
        	
        	orderDto.setBuy_user(buyBidService.getDataOfBuyBid(buy_num).getUser_num());
        	orderDto.setSell_user(user_num);
        	orderDto.setItem_num(item_num);
          	orderDto.setSize(buyBidService.getDataOfBuyBid(buy_num).getBuy_size());
        	orderDto.setWish_price(Integer.parseInt(buyBidService.getDataOfBuyBid(buy_num).getBuy_wishprice()));            
			
			orderService.insertOrder(orderDto);
			buyBidService.updateBuyStatus(buy_num);      	
            
        }
        
		return loginEmail;
	}
}
