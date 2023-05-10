package boot.mvc.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchaseController {

	@Autowired
	PurcahseService service;

	//구매 사이즈 선택
	@GetMapping("/buy/select")
	public String selectSize() {
		return "purchase/purchaseSize";
	}

	//구매 동의
	@GetMapping("/buy/check")
	public ModelAndView buyAgree(String size, String deliveryWay) {
		ModelAndView mv=new ModelAndView();

		mv.addObject("size",size);
		mv.addObject("deliveryWay",deliveryWay);

		mv.setViewName("purchase/purchaseAgree");
		return mv;
	}

	//구매입찰/즉시구매 선택
	@GetMapping("/buy/type")
	public ModelAndView selectType(String size,String deliveryWay) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("size",size);
		mv.addObject("deliveryWay",deliveryWay);

		mv.setViewName("purchase/purchaseType");
		return mv;
	}

	//구매/결제
	@GetMapping("/buy/order")
	public ModelAndView buyOrder() {
		ModelAndView mv=new ModelAndView();

		mv.setViewName("purchase/purchaseOrder");
		return mv;
	}
}
