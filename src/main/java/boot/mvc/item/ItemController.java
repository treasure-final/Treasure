package boot.mvc.item;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ItemController {

	@Autowired
	ItemMapperInter mapper;
	
		@GetMapping("/item/itemlist")
		public ModelAndView list()
		{
			ModelAndView iview =new ModelAndView();
			//전체 상품갯수 
			int totitem= mapper.getTotalCount();
			
			List<ItemDto> list = mapper.getAllData();
			
			iview.addObject("list", list);
			iview.addObject("totitem", totitem);
			iview.setViewName("/item/itemlist");
			return iview;
		}
		
		@GetMapping("/item/itemck")
		public ModelAndView checklist(@RequestParam(required = false, value = "ck") String ck,String brand) {
			
			  System.out.println(ck); 
			  System.out.println(brand);
			 
			ModelAndView model=new ModelAndView();
			Map<String, String> map=new HashMap<>();
			
			
			map.put("ck", ck);
			map.put("brand", brand);
			
			int stotitem =mapper.getSearchTotalCount(map);
			
			List<ItemDto> list=mapper.getSearhAllData(map);
			
			model.addObject("list", list);				
			model.addObject("stotitem", stotitem);
			model.setViewName("/item/itemlist");
			
			return model;
		}
		
		@GetMapping("/item/itemsort")
		public ModelAndView sortlist()
		{ ModelAndView sview = new ModelAndView();
		int soritem = mapper.getTotalCount();
		List<ItemDto> list = mapper.getItemSort();
			
		sview.addObject("list", list);
		sview.addObject("soritem",soritem);
			sview.setViewName("/item/itemlist");
			return sview;
		}
	
	@GetMapping("/item/insert")
	public String insert() {
		return "/item/iteminsert";
	}

}
