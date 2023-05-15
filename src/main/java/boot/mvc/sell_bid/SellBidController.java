package boot.mvc.sell_bid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.user.UserDto;
import boot.mvc.user.UserService;

@Controller
public class SellBidController {

	@Autowired
	SellBidService service;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/sell/sellSize")
	public String sellSizeForm() {
		return "/sell/sellSize";
	}
	
	@GetMapping("/sell/sellAgree")
	public ModelAndView sellAgreeForm(String size) {
		
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("size", size);		
		mview.setViewName("/sell/sellAgree");	
		
		return mview;
	}
	
	@GetMapping("/sell/sellType")
	public ModelAndView sellTypeForm(String size) {

		ModelAndView mview=new ModelAndView();
		
		mview.addObject("size", size);		
		mview.setViewName("/sell/sellType");
		
		return mview;
	}
	
	@GetMapping("/sell/sellCalculate")
	public ModelAndView sellCalculateForm(String price, String size, String deadline) {
		
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("price", price);
		mview.addObject("size", size);
		mview.addObject("deadline", deadline);
		
		mview.setViewName("/sell/sellCalculate");
		
		return mview;
	}
}
