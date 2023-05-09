package boot.mvc.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PurcahseController {

	@Autowired
	PurcahseService service;


	@RequestMapping(value = "/buy/select", method = RequestMethod.GET)
	public ModelAndView selectSize() {
		ModelAndView mv=new ModelAndView();

		mv.setViewName("purchase/purchaseSize");
		return mv;
	}

	@GetMapping("/buy/type")
	public ModelAndView selectType(String size, String deliveryWay) {
		ModelAndView mv=new ModelAndView();
		Map<String,Object> map=new HashMap<>();
		map.put("size",size);
		map.put("deliveryWay",deliveryWay);
		mv.addObject("map",map);

		mv.setViewName("purchase/purchaseType");
		return mv;
  }


	@GetMapping("/buy/check")
	public String buyAgree() {
		return "purchase/purchaseAgree";
	}
}