package boot.mvc.purchase;

import boot.mvc.sell_bid.SellBidDto;

import java.util.List;
import java.util.Map;

public interface PurchaseServiceInter {

    public List<SellBidDto> getBuyNowPrice(String item_num);

	public void insertPurchase(PurchaseDto purchaseDto);
    public PurchaseDto getPurchaseData(String user_num,String item_num);

}
