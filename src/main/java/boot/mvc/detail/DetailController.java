package boot.mvc.detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.item.ItemDto;

@Controller
public class DetailController {
	
	@Autowired
	DetailMapperInter Dmapper;

	@GetMapping("/item/detail")
	public String detail() {
		return "/item/detail";
	}
	@GetMapping("/item/DetailgetData")
	public ModelAndView DetailgetData(String Item_num) {
		ModelAndView mview = new ModelAndView();
		
		ItemDto dto = Dmapper.DetailgetData(Item_num);
		
		mview.addObject("Ddto", dto);
		
		mview.setViewName("/item/detail");
		
		return mview;
	}
}
