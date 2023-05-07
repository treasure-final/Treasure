package boot.mvc.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PurcahseController {

	@Autowired
	PurcahseService service;

	@GetMapping("/buy/type")
	public String selectType() {
		return "purchase/purchaseType";
	}
}
