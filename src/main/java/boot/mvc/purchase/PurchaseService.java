package boot.mvc.purchase;

import boot.mvc.sell_bid.SellBidDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PurchaseService implements PurchaseServiceInter {

	@Autowired
	PurchaseMapperInter mapper;

	@Override
	public void insertPurchase(PurchaseDto purchaseDto) {
		mapper.insertPurchase(purchaseDto);
	}

	@Override
	public PurchaseDto getPurchaseData(String user_num, String item_num) {
		Map<String,String> map=new HashMap<>();
		map.put("user_num",user_num);
		map.put("item_num",item_num);
		return mapper.getPurchaseData(map);
	}

	@Override
	public List<SellBidDto> getBuyNowPrice(String item_num) {
		return mapper.getBuyNowPrice(item_num);
	}
}
