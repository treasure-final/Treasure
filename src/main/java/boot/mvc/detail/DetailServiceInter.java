package boot.mvc.detail;

import java.util.List;

import boot.mvc.item.ItemDto;

public interface DetailServiceInter {
	public ItemDto DetailgetData(String item_num);
	
	public List<ItemDto> getAllData();
}
