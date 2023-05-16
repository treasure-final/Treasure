package boot.mvc.detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.item.ItemDto;
import boot.mvc.item.ItemService;

@Controller
public class DetailController {
	
	@Autowired
	DetailService Dservice;
	
	@Autowired
	ItemService Iservice;

	@GetMapping("/item/detail")
	public String detail() {
		return "/item/detail";
	}
	@GetMapping("/item/DetailgetData")
	public ModelAndView DetailgetData(@RequestParam String Item_num) {
	    ModelAndView mview = new ModelAndView();

	    ItemDto dto = Dservice.DetailgetData(Item_num);

	    mview.addObject("Ddto", dto);
	    mview.setViewName("/item/detail");

	    return mview;
	}
	
	
	
}
