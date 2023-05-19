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
	
	public List<Map<String, Object>> getPurchaseData(String item_num);
	
	public String getPurchaseRecentPriceAll(String item_num);
	
	public int getPurchaseRecentPriceSize(String item_num, String buy_size);

}
