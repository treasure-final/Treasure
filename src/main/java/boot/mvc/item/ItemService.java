package boot.mvc.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ItemService implements ItemServiceInter {

	@Autowired
	ItemMapperInter mapper;

	@Override
	public List<ItemDto> getItemKorName() {
		return mapper.getItemKorName();
	}
}
