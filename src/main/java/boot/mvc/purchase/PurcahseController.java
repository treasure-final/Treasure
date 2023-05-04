package boot.mvc.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PurcahseController {

	@Autowired
	PurcahseService service;


	@GetMapping("/select")
	public String selectSize() {
		return "purchase/purchaseSize";
	}
}
