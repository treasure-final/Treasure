package boot.mvc.buy_now;

import boot.mvc.sell_bid.SellBidDto;

import java.util.List;
import java.util.Map;

public interface BuyNowServiceInter {
    public List<SellBidDto> getBuyNowPrice(String item_num);
    public List<BuyNowDto> getDataByStatus0(String user_num);
    public List<BuyNowDto> getDataByStatus1(String user_num);
    public void insertBuyNow(BuyNowDto buyNowDto);
    public void updateSellStatus(String sell_num);
}
