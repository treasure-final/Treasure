package boot.mvc.detail;

import java.util.List;
import java.util.Map;

import boot.mvc.buy_bid.BuyBidDto;
import boot.mvc.item.ItemDto;

public interface DetailServiceInter {
	public ItemDto DetailgetData(String item_num);

	public List<ItemDto> getAllData();

	public List<Map<String, Object>> getBuyBidGroupedData(String item_num);

	public List<Map<String, Object>> getSellBidGroupedData(String item_num);
	
	public List<Map<String, Object>> getPurchaseData();
	
	public String getPurchaseRecentPriceAll(String item_num);

}
