package boot.mvc.sell_now;

public interface SellNowServiceInter {

	public void insertSellNow(SellNowDto sellNowDto);
	public String getNowinsertSellNowNum();
	public void updateSellStatusSoldOut(String sellnow_num);	
	
}
