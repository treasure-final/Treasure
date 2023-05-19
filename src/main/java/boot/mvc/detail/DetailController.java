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
import boot.mvc.purchase.PurchaseService;
import boot.mvc.sell_bid.SellBidDto;

@Controller
public class DetailController {

	@Autowired
	DetailService Dservice;

	@Autowired
	PurchaseService purchaseService;
	
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

		List<SellBidDto> priceList =  purchaseService.getBuyNowPrice(item_num);
		mview.addObject("priceList", priceList);
			
		int minPrice = 0; 

		if (!priceList.isEmpty()) { // priceList가 비어있지 않은 경우
			minPrice = priceList.get(0).getSell_wishprice(); // 첫 번째 요소를 초기 최소 가격으로 설정

		    for (SellBidDto sellBidDto : priceList) {
		        if (sellBidDto.getSell_wishprice() < minPrice) {
		        	minPrice = sellBidDto.getSell_wishprice(); // 더 작은 가격을 가진 요소를 최소 가격으로 업데이트
		        }
		    }
		}
		
		mview.addObject("minPrice", minPrice);
		
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