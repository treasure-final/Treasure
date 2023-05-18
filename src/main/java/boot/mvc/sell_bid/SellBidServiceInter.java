package boot.mvc.sell_bid;

import java.util.List;

public interface SellBidServiceInter {

	public void insertSellBid(SellBidDto SellBidDto);
	public String getNowinsertSellBidNum();
	public List<SellBidDto> getSellPriceListByitemNum(String item_num);

}
