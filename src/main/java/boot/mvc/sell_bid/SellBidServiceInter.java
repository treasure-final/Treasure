package boot.mvc.sell_bid;

import java.util.List;

public interface SellBidServiceInter {

	public void insertSellBid(SellBidDto SellBidDto);
	public String getNowinsertSellBidNum();
	public List<SellBidDto> getSellPriceListByitemNum(String item_num);
	public SellBidDto getSellBidData(String user_num, String sell_num);
	public int getSellBidCount(String user_num);
	public int getSellBidSuccessCount(String user_num);
	public SellBidDto getSellBidDataOfSellNum(String sell_num);
	
}
