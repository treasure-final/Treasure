package boot.mvc.detail;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import boot.mvc.buy_now.BuyNowService;
import boot.mvc.item.ItemDto;
import boot.mvc.sell_bid.SellBidDto;

@Controller
public class DetailController {

	@Autowired
	DetailService Dservice;

	@Autowired
	BuyNowService buyNowService;
	
	@GetMapping("/item/detail")
	public ModelAndView detail(String item_num, String buy_size, Model model) {
		ModelAndView mview = new ModelAndView();

		List<ItemDto> list = Dservice.getAllData();
		ItemDto dto = Dservice.DetailgetData(item_num);
		//List<Map<String, Object>> groupedBuyData = Dservice.getBuyBidGroupedData(item_num);
		//List<Map<String, Object>> groupedSellData = Dservice.getSellBidGroupedData(item_num);
		//List<Map<String, Object>> getOrderData = Dservice.getOrderData(item_num);

		mview.addObject("list", list);
		mview.addObject("Ddto", dto);
		//mview.addObject("groupedBuyData", groupedBuyData);
		//mview.addObject("groupedSellData", groupedSellData);
		//mview.addObject("getOrderData", getOrderData);

		List<SellBidDto> priceList =  buyNowService.getBuyNowPrice(item_num);
		
		int minPrice = 0; 

		if (!priceList.isEmpty()) { // priceList가 비어있지 않은 경우
			minPrice = priceList.get(0).getSell_wishprice(); // 첫 번째 요소를 초기 최소 가격으로 설정

		    for (SellBidDto sellBidDto : priceList) {
		        if (sellBidDto.getSell_wishprice() < minPrice) {
		        	minPrice = sellBidDto.getSell_wishprice(); // 더 작은 가격을 가진 요소를 최소 가격으로 업데이트
		        }
		    }
		}
		
		mview.addObject("priceList", priceList);
		mview.addObject("minPrice", minPrice);
		
		mview.setViewName("/3/item/detail");

		model.addAttribute("item_num", item_num);
		return mview;
	}
	
	@ResponseBody
	@GetMapping("/item/getOrderRecentPriceSize")
	public int getOrderRecentPriceSize(@RequestParam String item_num, @RequestParam String buy_size) {
		int price = 0;
	
		if(buy_size.equals("모든 사이즈"))
			price = Dservice.getOrderRecentPriceAll(item_num);
		else 
			price = Dservice.getOrderRecentPriceSize(item_num, buy_size);
		
		return price;
	}
	
	@ResponseBody
	@GetMapping("/item/getChartData")
	public Map<String, Object> getChartData(@RequestParam String type, @RequestParam String item_num,
			@RequestParam String size, @RequestParam String period) {
		
		Map<String, Object> map = new HashMap<>();
		String start = "";
		String end = "";
		
		// 오늘 날짜
        LocalDate today = LocalDate.now().plusDays(1);

        // 1개월 전 날짜
        LocalDate oneMonthAgo = today.minusMonths(1);

        // 3개월 전 날짜
        LocalDate threeMonthsAgo = today.minusMonths(3);

        // 6개월 전 날짜
        LocalDate sixMonthsAgo = today.minusMonths(6);

        // 1년 전 날짜
        LocalDate oneYearAgo = today.minusYears(1);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        String oneMonthAgoStr = oneMonthAgo.format(formatter);
        String threeMonthsAgoStr = threeMonthsAgo.format(formatter);
        String sixMonthsAgoStr = sixMonthsAgo.format(formatter);
        String oneYearAgoStr = oneYearAgo.format(formatter);
		
		if(period.equals("1개월")) 
			start = oneMonthAgoStr; 
		else if(period.equals("3개월"))
			start = threeMonthsAgoStr; 
		else if(period.equals("6개월"))
			start = sixMonthsAgoStr; 
		else if(period.equals("1년"))
			start = oneYearAgoStr; 
		else 
			start = "null";
		
		end = today.format(formatter);
			
		List<Map<String, Object>> chartData = new ArrayList<>();
		List<String> date = new ArrayList<>(); 
		List<Integer> wish_price = new ArrayList<>();
		
		if(type.equals("체결 거래")) {
			chartData = Dservice.getOrderChartData(size, item_num, start, end);
			
			for (Map<String, Object> data : chartData) {
				date.add(data.get("order_date").toString());
				wish_price.add(Integer.parseInt(data.get("wish_price").toString())); 
			}
			 
			map.put("date", date); 
			map.put("wish_price", wish_price);
			
		} else if(type.equals("판매 입찰")) {
			chartData = Dservice.getSellChartData(size, item_num, start, end);
			
			for (Map<String, Object> data : chartData) {
				date.add(data.get("sell_inputday").toString());
				wish_price.add(Integer.parseInt(data.get("sell_wishprice").toString())); 
			}
			 
			map.put("date", date); 
			map.put("wish_price", wish_price);
			
		} else {
			chartData = Dservice.getBuyChartData(size, item_num, start, end);
			
			for (Map<String, Object> data : chartData) {
				date.add(data.get("buy_inputday").toString());
				wish_price.add(Integer.parseInt(data.get("buy_wishprice").toString())); 
			}
			 
			map.put("date", date); 
			map.put("wish_price", wish_price);
			
		}
		
		 // System.out.println(type + "," + period + ", " + size + ", " + item_num + ", " + start + ", " + end + ", " + chartData.size()); 
			
		return map;
	}

	@GetMapping("/item/getTabContent")
	@ResponseBody
	public List<TabContentDto> getTabContent(@RequestParam String type, @RequestParam String item_num, @RequestParam String size) {
		List<TabContentDto> content = new ArrayList<>();
		List<Map<String, Object>> dataList = new ArrayList<>();
		TabContentDto tabContentDto = new TabContentDto();
		
		if(type.equals("체결 거래")) {
			dataList = Dservice.getBuyBidGroupedData(item_num, size);
			
			for (Map<String, Object> data : dataList) {
				tabContentDto.setDate(data.get("order_date").toString());
				//tabContentDto.setPrice(data.get("wish_price"));
			}
		}
		else if(type.equals("판매 입찰")) {
			dataList = Dservice.getSellBidGroupedData(item_num, size);
		}
		else {
			dataList = Dservice.getOrderData(item_num, size);
		}
		
		return content;
	}
	
}