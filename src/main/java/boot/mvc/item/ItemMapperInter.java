package boot.mvc.item;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ItemMapperInter {

   public int getTotalCount();
   public List<ItemDto> getAllData();
   public List<ItemDto> getCategory(Map<String, String> map);
   public int getSearchTotalCount(Map<String, String> map);
   public List<ItemDto> getSearhAllData(Map<String, String> map); 
   public List<ItemDto> getItemSort();
}
