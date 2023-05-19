package boot.mvc.detail;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.buy_bid.BuyBidDto;
import boot.mvc.item.ItemDto;

@Controller
public class DetailController {

	@Autowired
	DetailService Dservice;

	@GetMapping("/item/detail")
	public ModelAndView detail(String item_num, String buy_size, Model model) {
		ModelAndView mview = new ModelAndView();

		List<ItemDto> list = Dservice.getAllData();
		ItemDto dto = Dservice.DetailgetData(item_num);
		List<Map<String, Object>> groupedBuyData = Dservice.getBuyBidGroupedData(item_num);
		List<Map<String, Object>> groupedSellData = Dservice.getSellBidGroupedData(item_num);
		List<Map<String, Object>> getPurchaseData = Dservice.getPurchaseData(item_num);
		String getPurchaseRecentPriceAll = Dservice.getPurchaseRecentPriceAll(item_num);
		

		mview.addObject("list", list);
		mview.addObject("Ddto", dto);
		mview.addObject("groupedBuyData", groupedBuyData);
		mview.addObject("groupedSellData", groupedSellData);
		mview.addObject("getPurchaseData", getPurchaseData);
		mview.addObject("getPurchaseRecentPriceAll", getPurchaseRecentPriceAll);

		mview.setViewName("/3/item/detail");

		model.addAttribute("item_num", item_num);
		return mview;
	}

//	@GetMapping("/item/detail")
//	public ModelAndView DetailgetData(@RequestParam String item_num) {
//		ModelAndView mview = new ModelAndView();
//
//		ItemDto dto = Dservice.DetailgetData(item_num);
//
//		mview.addObject("Ddto", dto);
//
//		mview.setViewName("/item/detail");
//
//		return mview;
//	}

}