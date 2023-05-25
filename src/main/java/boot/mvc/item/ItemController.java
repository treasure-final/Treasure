package boot.mvc.item;

import java.util.List;

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
	public ModelAndView itemSearch(String searchText,@RequestParam(required = false)String ck,@RequestParam(required = false) String brand) {
//		System.out.println(searchText);
//		System.out.println(brand);
		ModelAndView mv=new ModelAndView();

		List<ItemDto> searchList=service.searchItems(searchText,ck,brand);
		mv.addObject("searchText",searchText);
		mv.addObject("searchList",searchList);
		mv.setViewName("/item/searchList");
		return mv;
	}

	@GetMapping("/item/searchselect")
	@ResponseBody
	public ModelAndView itemBrandSearch(String searchText,String ck,String brand) {
		ModelAndView mv=new ModelAndView();

		System.out.println(searchText);
		System.out.println(brand);
		System.out.println(ck);
		if(ck!=null || brand!=null) {
			List<ItemDto> searchList=service.searchItems(searchText,ck,brand);
			mv.addObject("searchList",searchList);
		} else {
			List<ItemDto> searchList=service.searchItems(searchText,ck,brand);
			mv.addObject("searchList",searchList);
		}

		mv.setViewName("/item/searchList");
		return mv;
	}
}
