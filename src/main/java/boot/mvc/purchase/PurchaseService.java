package boot.mvc.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PurchaseService implements PurchaseServiceInter {

	@Autowired
	PurchaseMapperInter mapper;

	@Override
	public void insertPurchase(PurchaseDto purchaseDto) {
		mapper.insertPurchase(purchaseDto);
	}
	
}
