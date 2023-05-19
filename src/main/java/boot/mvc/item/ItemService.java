package boot.mvc.item;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service
public class ItemService implements ItemServiceInter {

	@Autowired
	ItemMapperInter inter;

	@Override
	public ItemDto getItemData(String item_num) {
		return inter.getItemData(item_num);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return inter.getTotalCount();
	}

	@Override
	public List<ItemDto> getAllData() {
		// TODO Auto-generated method stub
		return inter.getAllData();
	}

	@Override
	public List<ItemDto> getCategory(Map<String, String> map) {
		// TODO Auto-generated method stub
		return inter.getCategory(map);
	}

	@Override
	public int getSearchTotalCount(Map<String, String> map) {
		// TODO Auto-generated method stub
		return inter.getSearchTotalCount(map);
	}

	@Override
	public List<ItemDto> getSearhAllData(Map<String, String> map) {
		// TODO Auto-generated method stub
		return inter.getSearhAllData(map);
	}

	@Override
	public List<ItemDto> getItemSort() {
		// TODO Auto-generated method stub
		return inter.getItemSort();
	}

}
