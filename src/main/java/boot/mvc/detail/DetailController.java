package boot.mvc.detail;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.item.ItemDto;

@Controller
public class DetailController {

	@Autowired
	DetailService Dservice;


	@GetMapping("/item/detail")
	public String detail(String item_num,Model model) {

		ItemDto dto = Dservice.DetailgetData(item_num);

		model.addAttribute("Ddto", dto);
		model.addAttribute("item_num",item_num);
	
		
		// 브랜드 아이템 리스트
		List<ItemDto> brandList = Dservice.getItemsByBrandname(dto.getItem_brandname());				
		model.addAttribute("brandList", brandList);
		
		return "/3/item/detail";
	}

	@GetMapping("/item/DetailgetData") 
	public ModelAndView DetailgetData(String Item_num) { 
		ModelAndView mview = new ModelAndView(); 
		ItemDto dto = Dservice.DetailgetData(Item_num); 
		mview.addObject("Ddto", dto); 
		mview.setViewName("/3/item/detail");
		
		return mview; 
	}
}