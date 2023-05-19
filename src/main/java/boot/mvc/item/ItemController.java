package boot.mvc.item;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ItemController {

	@Autowired
	ItemService service;

	@GetMapping("/item/itemlist")
	public ModelAndView list() {
		ModelAndView iview =new ModelAndView();
		//전체 상품갯수
		int totitem= service.getTotalCount();

		List<ItemDto> list = service.getAllData();

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

		int stotitem =service.getSearchTotalCount(ck,brand);
		List<ItemDto> list=service.getSearhAllData(ck,brand);

		model.addObject("list", list);
		model.addObject("stotitem", stotitem);
		model.setViewName("/item/itemlist");

		return model;
	}

	@GetMapping("/item/itemsort")
	public ModelAndView sortlist() { ModelAndView sview = new ModelAndView();
		int soritem = service.getTotalCount();
		List<ItemDto> list = service.getItemSort();

		sview.addObject("list", list);
		sview.addObject("soritem",soritem);
		sview.setViewName("/item/itemlist");
		return sview;
	}

	@GetMapping("/item/itemsearch")
	public ModelAndView itemSearch(String searchText) {
		System.out.println(searchText);
		ModelAndView mv=new ModelAndView();

		List<ItemDto> searchList=service.searchItems(searchText);
		mv.addObject("searchList",searchList);
		mv.addObject("searchText",searchText);

		mv.setViewName("/item/searchList");
		return mv;
	}
}
