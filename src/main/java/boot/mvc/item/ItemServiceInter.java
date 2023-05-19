package boot.mvc.item;

import java.util.List;
import java.util.Map;

public interface ItemServiceInter {

	public ItemDto getItemData(String item_num);

	public int getTotalCount();

	public List<ItemDto> getAllData();

	public List<ItemDto> getCategory(Map<String, String> map);

	public int getSearchTotalCount(Map<String, String> map);

	public List<ItemDto> getSearhAllData(Map<String, String> map);

	public List<ItemDto> getItemSort();

}
