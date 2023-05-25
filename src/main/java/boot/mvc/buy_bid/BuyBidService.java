package boot.mvc.buy_bid;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public void updateBuyStatus(String buy_num) {
		mapper.updateBuyStatus(buy_num);
	}

	@Override
	public List<BuyBidDto> getBuyBidData(String user_num) {
		return mapper.getBuyBidData(user_num);
	}

	@Override
	public List<BuyBidDto> getItemInfoByBuyBid(String user_num) {
		return mapper.getItemInfoByBuyBid(user_num);
	}

	@Override
	public String getNowinsertBuyBidNum() {
		return mapper.getNowinsertBuyBidNum();
}
  @Override
	public List<BuyBidDto> getListBuyBidTotal(String user_num, int offset) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_num", user_num);
		map.put("offset", offset);
		return mapper.getListBuyBidTotal(map);
	}

	@Override
	public int getTotalBuyBidCount(String user_num) {
		return mapper.getTotalBuyBidCount(user_num);
	}
}
