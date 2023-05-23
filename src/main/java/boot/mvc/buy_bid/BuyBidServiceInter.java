package boot.mvc.buy_bid;

import java.util.HashMap;

public interface BuyBidServiceInter {
	
    public void insertBuyBid(BuyBidDto buyBidDto);
    public BuyBidDto getBuyBidForSellNow(String item_num, String buy_size);
    public BuyBidDto getDataOfBuyBid(String buy_num);
    public void updateBuyStatus(String buy_num);
    
}
