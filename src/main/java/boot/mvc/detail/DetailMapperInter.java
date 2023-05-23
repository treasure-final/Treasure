package boot.mvc.detail;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.mvc.item.ItemDto;

@Mapper
public interface DetailMapperInter {

	public ItemDto DetailgetData(String item_num);

	public List<ItemDto> getAllData();
	
	public List<Map<String, Object>> getBuyBidGroupedData(Map<String, Object> map);
	
	public List<Map<String, Object>> getSellBidGroupedData(Map<String, Object> map);
  
	public List<Map<String, Object>> getOrderData(Map<String, Object> map);
	
	public int getOrderRecentPriceAll(String item_num);
	
	public int getOrderRecentPriceSize(Map<String, Object> map);
	
	public List<Map<String, Object>> getOrderChartData(Map<String, Object> map);

	public List<Map<String, Object>> getSellChartData(Map<String, Object> map);
	
	public List<Map<String, Object>> getBuyChartData(Map<String, Object> map);

}
