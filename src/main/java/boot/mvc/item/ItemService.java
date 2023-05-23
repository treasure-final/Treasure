package boot.mvc.item;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;



@Service
public class ItemService implements ItemServiceInter {

	@Autowired
	ItemMapperInter inter;

	@Override

	public int getTotalCount() {
		return inter.getTotalCount();
	}


	@Override
	public List<ItemDto> getAllData() {
		return inter.getAllData();
	}

	@Override
	public List<ItemDto> getCategory(String ck, String brand) {
		Map<String, String> map=new HashMap<>();
		map.put("ck",ck);
		map.put("brand",brand);
		return inter.getCategory(map);
	}

	@Override
	public int getSearchTotalCount(String ck, String brand) {
		Map<String, String> map=new HashMap<>();
		map.put("ck",ck);
		map.put("brand",brand);
		return inter.getSearchTotalCount(map);
	}

	@Override
	public List<ItemDto> getSearhAllData(String ck, String brand) {
		Map<String, String> map=new HashMap<>();
		map.put("ck",ck);
		map.put("brand",brand);
		return inter.getSearhAllData(map);
	}

	@Override
	public List<ItemDto> getItemSort() {
		return inter.getItemSort();
	}

	@Override
	public ItemDto getItemData(String item_num) {
		return inter.getItemData(item_num);
	}

	@Override
	public List<ItemDto> searchItems(String searchText,String brand) {
		Map<String,String> map=new HashMap<>();
		map.put("searchText",searchText);
		map.put("brand",brand);
		return inter.searchItems(map);
	}




	
}
