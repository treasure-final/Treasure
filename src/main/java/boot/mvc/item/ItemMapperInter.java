package boot.mvc.item;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface ItemMapperInter {
    public List<ItemDto> getItemKorName();
}
