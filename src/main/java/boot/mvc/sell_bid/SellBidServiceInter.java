package boot.mvc.sell_bid;

public interface SellBidServiceInter {
	public void insertSellBid(SellBidDto SellBidDto);
	public String getNowinsertSellBidNum();
	public SellBidDto getSellBidDatas(String item_num);
}
