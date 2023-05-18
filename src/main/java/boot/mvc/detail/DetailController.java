package boot.mvc.detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.item.ItemDto;

@Controller
public class DetailController {

	@Autowired
	DetailMapperInter Dmapper;

	@GetMapping("/item/detail")
	public String detail(String item_num,Model model) {
System.out.println(item_num);
		ItemDto dto = Dmapper.DetailgetData(item_num);

		model.addAttribute("Ddto", dto);
		model.addAttribute("item_num",item_num);
	
		return "/3/item/detail";
	}

	@GetMapping("/item/DetailgetData") 
	public ModelAndView DetailgetData(String Item_num) { 
		ModelAndView mview = new ModelAndView(); 
		ItemDto dto = Dmapper.DetailgetData(Item_num); 
		mview.addObject("Ddto", dto); 
		mview.setViewName("/3/item/detail");
		
		return mview; 
	}
}