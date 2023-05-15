package boot.mvc.sell_bid;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.detail.DetailService;
import boot.mvc.item.ItemDto;
import boot.mvc.item.ItemService;
import boot.mvc.item.ItemServiceInter;
import boot.mvc.user.UserDto;
import boot.mvc.user.UserService;

@Controller
public class SellBidController {

	@Autowired
	SellBidService service;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ItemService itemService;
	
	
	
	@GetMapping("/sell/sellSize")
	public String sellSizeForm(Model model, @RequestParam("item_num") String item_num) {
		
		ItemDto itemDto=itemService.getItemData(item_num);
		
		model.addAttribute("itemDto", itemDto);
		model.addAttribute("item_num", item_num);
		System.out.println(item_num);
				
		return "/sell/sellSize";
	}
	
	@GetMapping("/sell/sellAgree")
	public ModelAndView sellAgreeForm(String size, Model model, @RequestParam("item_num") String item_num) {
		
		ModelAndView mview=new ModelAndView();
		
		ItemDto itemDto=itemService.getItemData(item_num);
		
		model.addAttribute("itemDto", itemDto);
		model.addAttribute("item_num", item_num);
		
		mview.addObject("size", size);
		mview.setViewName("/sell/sellAgree");	
		
		return mview;
	}
	
	@GetMapping("/sell/sellType")
	public ModelAndView sellTypeForm(String size, Model model, @RequestParam("item_num") String item_num) {

		ModelAndView mview=new ModelAndView();
		
		ItemDto itemDto=itemService.getItemData(item_num);
		
		model.addAttribute("itemDto", itemDto);
		model.addAttribute("item_num", item_num);
		
		mview.addObject("size", size);
		
		mview.setViewName("/sell/sellType");
		
		return mview;
	}
	
	@GetMapping("/sell/sellCalculate")
	public ModelAndView sellCalculateForm(String hopePrice, String size, String deadline, @RequestParam("item_num") String item_num, Model model) {
		
		ModelAndView mview=new ModelAndView();
		
		ItemDto itemDto=itemService.getItemData(item_num);
		
		model.addAttribute("itemDto", itemDto);
		model.addAttribute("item_num", item_num);
		
		mview.addObject("hopePrice", hopePrice);
		mview.addObject("size", size);
		mview.addObject("deadline", deadline);
		
		
		mview.setViewName("/sell/sellCalculate");
		
		return mview;
	}
}
