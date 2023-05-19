package boot.mvc.detail;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.mvc.item.ItemDto;

@Mapper
public interface DetailMapperInter {
	
	public ItemDto DetailgetData(String item_num);

	public List<ItemDto> getAllData();
	
	public List<Map<String, Object>> getBuyBidGroupedData(String item_num);
	
	public List<Map<String, Object>> getSellBidGroupedData(String item_num);
	
	public List<Map<String, Object>> getPurchaseData();
	
	public String getPurchaseRecentPriceAll(String item_num);
	
	public List<ItemDto> getItemsByBrandname(String item_brandname);
	 
}
