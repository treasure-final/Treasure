package boot.mvc.purchase;

import boot.mvc.sell_bid.SellBidDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PurchaseService implements PurchaseServiceInter {

	@Autowired
	PurchaseMapperInter mapper;

	@Override
	public void insertPurchase(PurchaseDto purchaseDto) {
		mapper.insertPurchase(purchaseDto);
	}
	
	public List<SellBidDto> getBuyNowPrice(String item_num) {
		return mapper.getBuyNowPrice(item_num);
	}

}
