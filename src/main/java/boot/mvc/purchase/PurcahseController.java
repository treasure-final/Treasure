package boot.mvc.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurcahseController {

	@Autowired
	PurcahseService service;

	@GetMapping("/buy/select")
	public ModelAndView selectSize() {
		ModelAndView mv=new ModelAndView();

		mv.setViewName("/purchase/purchaseSize");
		return mv;
	}
}
