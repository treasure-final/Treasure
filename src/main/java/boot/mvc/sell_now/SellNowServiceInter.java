package boot.mvc.sell_now;

public interface SellNowServiceInter {

	public void insertSellNow(SellNowDto sellNowDto);
	public String getNowinsertSellNowNum();
	public void updateSellStatusSoldOut(String sellnow_num);
	//getDta
	public SellNowDto getSellNowData(String user_num, String sellnow_num);

}
