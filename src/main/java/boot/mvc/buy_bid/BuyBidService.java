package boot.mvc.buy_bid;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuyBidService implements BuyBidServiceInter {

	@Autowired
	BuyBidMapperInter mapper;

	@Override
	public void insertBuyBid(BuyBidDto buyBidDto) {
		mapper.insertBuyBid(buyBidDto);
	}

	@Override
	public BuyBidDto getBuyBidForSellNow(String item_num, String buy_size) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("item_num", item_num);
		map.put("buy_size", buy_size);
		
		return mapper.getBuyBidForSellNow(map);
	}

	@Override
	public BuyBidDto getDataOfBuyBid(String buy_num) {
		return mapper.getDataOfBuyBid(buy_num);
	}

}
