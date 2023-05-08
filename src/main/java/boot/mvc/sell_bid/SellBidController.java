package boot.mvc.sell_bid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SellBidController {

	@Autowired
	SellBidService service;
	
	@GetMapping("/agreeForm")
	public String agreeForm() {
		return "sell/SellAgree";
	}
}
