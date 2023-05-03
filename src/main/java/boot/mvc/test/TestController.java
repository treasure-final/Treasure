package boot.mvc.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@Autowired
	TestService service;
	
	@GetMapping("/")
	public String test(Model model) {
		
		int total = service.getTotalCount();
		model.addAttribute("total", total);
		
		return "detail";
	}
	
}
