package boot.mvc.sell_bid;

public interface SellBidServiceInter {
	public void insertSellBid(SellBidDto SellBidDto);
	public String getNowinsertSellBidNum();
	public SellBidDto getSellBidData(String user_num, String sell_num);
}
