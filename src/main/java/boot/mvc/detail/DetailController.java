package boot.mvc.detail;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		List<Map<String, Object>> getOrderData = Dservice.getOrderData(item_num);

		mview.addObject("list", list);
		mview.addObject("Ddto", dto);
		mview.addObject("groupedBuyData", groupedBuyData);
		mview.addObject("groupedSellData", groupedSellData);
		mview.addObject("getOrderData", getOrderData);

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
	
	@ResponseBody
	@GetMapping("/item/getOrderRecentPriceSize")
	public int getPurchaseRecentPriceSize(@RequestParam("item_num") String itemNum, @RequestParam("buy_size") String buySize) {
		int price = 0;

		if(buySize.equals("모든 사이즈"))
			price = Dservice.getOrderRecentPriceAll(itemNum);
		else 
			price = Dservice.getOrderRecentPriceSize(itemNum, buySize);
		
		return price;
	}
	
	@ResponseBody
	@GetMapping("/item/getChartData")
	public Map<String, Object> getChartData(@RequestParam String item_num,
			@RequestParam String size) {
		// size, wish_price, order_date
		Map<String, Object> map = new HashMap<>();
		
		List<Map<String, Object>> orderData = Dservice.getOrderData(item_num, size);
		
		List<String> order_date = new ArrayList<>();
	    List<Integer> wish_price = new ArrayList<>();
	    
	    for (Map<String, Object> order : orderData) {
	    	order_date.add(order.get("order_date").toString());
	        wish_price.add(Integer.parseInt(order.get("wish_price").toString()));
	    }
	    
	    map.put("order_date", order_date);
	    map.put("wish_price", wish_price);
		
		return map;
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