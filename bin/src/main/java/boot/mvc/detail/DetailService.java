package boot.mvc.detail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	public List<Map<String, Object>> getBuyBidGroupedData(String item_num) {
		// TODO Auto-generated
		// method stub
		return mapper.getBuyBidGroupedData(item_num);
	}

	@Override
	public List<Map<String, Object>> getSellBidGroupedData(String item_num) {
		// TODO Auto-generated
		// method stub
		return mapper.getSellBidGroupedData(item_num);
	}

	@Override
	public List<Map<String, Object>> getOrderData(String item_num, String size) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		
		map.put("item_num", item_num);
		map.put("size", size);
		
		return mapper.getOrderData(map);
	}

	@Override
	public int getOrderRecentPriceAll(String item_num) {
		// TODO Auto-generated method stub
		return mapper.getOrderRecentPriceAll(item_num);
	}
	
	@Override
	public int getOrderRecentPriceSize(String item_num, String buy_size) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("item_num", item_num);
		map.put("buy_size", buy_size);
		
		return mapper.getOrderRecentPriceSize(map);
	}

}
