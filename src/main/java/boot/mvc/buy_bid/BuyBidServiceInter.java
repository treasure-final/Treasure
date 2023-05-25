package boot.mvc.buy_bid;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BuyBidServiceInter {
	
    public void insertBuyBid(BuyBidDto buyBidDto);
    public BuyBidDto getBuyBidForSellNow(String item_num, String buy_size);
    public BuyBidDto getDataOfBuyBid(String buy_num);
    public void updateBuyStatus(String buy_num);
    public List<BuyBidDto> getBuyBidData(String user_num);
    public List<BuyBidDto> getItemInfoByBuyBid(String user_num);
    public String getNowinsertBuyBidNum();
    public List<BuyBidDto> getListBuyBidTotal(String user_num, int offset);
    public int getTotalBuyBidCount(String user_num);
}
