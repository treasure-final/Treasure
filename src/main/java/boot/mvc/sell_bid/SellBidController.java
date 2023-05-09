package boot.mvc.sell_bid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SellBidController {

	@Autowired
	SellBidService service;
	
	@GetMapping("/sell/sellSize")
	public String sellSizeForm() {
		return "/sell/sellSize";
	}
	
	@GetMapping("/sell/sellAgree")
	public String sellAgreeForm() {
		return "/sell/sellAgree";
	}
	
	@GetMapping("/sell/sellType")
	public String sellTypeForm() {
		return "/sell/sellType";
	}
}
