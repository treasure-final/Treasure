package boot.mvc.detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.mvc.item.ItemDto;

@Service
public class DetailService implements DetailServiceInter {

	@Autowired
	DetailMapperInter mapper;

	@Override
	public ItemDto DetailgetData(String item_num) {
		// TODO Auto-generated method stub
		return mapper.DetailgetData(item_num);
	}

}
