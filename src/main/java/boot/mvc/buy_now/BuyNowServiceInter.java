package boot.mvc.buy_now;

import boot.mvc.purchase.PurchaseDto;
import boot.mvc.sell_bid.SellBidDto;

import java.util.List;

public interface BuyNowServiceInter {
    public List<SellBidDto> getBuyNowPrice(String item_num);

    public List<PurchaseDto> getDataByStatus0(String user_num);

    public List<PurchaseDto> getDataByStatus1(String user_num);

}
