package boot.mvc.detail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.mvc.buy_bid.BuyBidDto;
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

	@Override
	public List<ItemDto> getAllData() {
		// TODO Auto-generated method stub
		return mapper.getAllData();
	}



	

	
	

}
