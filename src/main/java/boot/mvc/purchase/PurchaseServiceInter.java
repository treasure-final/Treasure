package boot.mvc.purchase;

import boot.mvc.sell_bid.SellBidDto;

import java.util.List;

public interface PurchaseServiceInter {
    public List<SellBidDto> getBuyNowPrice(String item_num);

	public void insertPurchase(PurchaseDto purchaseDto);
	

}
