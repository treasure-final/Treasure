package boot.mvc.detail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Service;

import boot.mvc.item.ItemDto;

@Service
public class DetailService implements DetailServiceInter {

	@Autowired
	DetailMapperInter mapper;

	@Override
	public ItemDto DetailgetData(String item_num) {
		// TODO Auto-generated
		// method stub
		return mapper.DetailgetData(item_num);
	}

	@Override
	public List<ItemDto> getAllData() {
		// TODO Auto-generated
		// method stub
		return mapper.getAllData();
	}

	@Override
	public List<Map<String, Object>> getBuyBidGroupedData(String item_num, String size) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("item_num", item_num);
		map.put("size", size);
		
		return mapper.getBuyBidGroupedData(map);
	}

	@Override
	public List<Map<String, Object>> getSellBidGroupedData(String item_num, String size) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("item_num", item_num);
		map.put("size", size);
			
		return mapper.getSellBidGroupedData(map);
	}

	@Override
	public List<Map<String, Object>> getOrderData(String item_num, String size) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("item_num", item_num);
		map.put("size", size);
		
		return mapper.getOrderData(map);
	}
	
	@Override
	public List<Integer> getOrderRecentPrice(String item_num, String size) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("item_num", item_num);
		map.put("size", size);
		
		return mapper.getOrderRecentPrice(map);
	}

	@Override
	public List<Map<String, Object>> getOrderChartData(String size, String item_num, String start, String end) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("size", size);
		map.put("item_num", item_num);
		map.put("start", start);
		map.put("end", end);
		
		return mapper.getOrderChartData(map);
	}

	@Override
	public List<Map<String, Object>> getSellChartData(String size, String item_num, String start, String end) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("size", size);
		map.put("item_num", item_num);
		map.put("start", start);
		map.put("end", end);
		
		return mapper.getSellChartData(map);
	}

	@Override
	public List<Map<String, Object>> getBuyChartData(String size, String item_num, String start, String end) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("size", size);
		map.put("item_num", item_num);
		map.put("start", start);
		map.put("end", end);
		
		return mapper.getBuyChartData(map);
	}

}
