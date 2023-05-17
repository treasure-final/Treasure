package boot.mvc.item;

import java.util.List;
import java.util.Map;

public interface ItemServiceInter {

    public int getTotalCount();
    public List<ItemDto> getAllData();
    public List<ItemDto> getCategory(String ck, String brand);
    public int getSearchTotalCount(String ck, String brand);
    public List<ItemDto> getSearhAllData(String ck, String brand);
    public List<ItemDto> getItemSort();
    public ItemDto getItemData(String item_num);
	 
}
