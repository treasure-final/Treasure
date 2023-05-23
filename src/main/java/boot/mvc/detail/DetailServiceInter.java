package boot.mvc.detail;

import java.util.List;
import java.util.Map;

import boot.mvc.buy_bid.BuyBidDto;
import boot.mvc.item.ItemDto;

public interface DetailServiceInter {
	public ItemDto DetailgetData(String item_num);

	public List<ItemDto> getAllData();

	public List<Map<String, Object>> getBuyBidGroupedData(String item_num, String size);

	public List<Map<String, Object>> getSellBidGroupedData(String item_num, String size);
	
	public List<Map<String, Object>> getOrderData(String item_num, String size);
	
	public int getOrderRecentPriceAll(String item_num);
	
	public int getOrderRecentPriceSize(String item_num, String buy_size);

	public List<Map<String, Object>> getOrderChartData(String size, String item_num, String start, String end);

	public List<Map<String, Object>> getSellChartData(String size, String item_num, String start, String end);
	
	public List<Map<String, Object>> getBuyChartData(String size, String item_num, String start, String end);
	
}
