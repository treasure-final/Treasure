package boot.mvc.sell_now;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellNowMapperInter {

	public void insertSellNow(SellNowDto sellNowDto);
	public String getNowinsertSellNowNum();
	public void updateSellStatusSoldOut(String sellnow_num);	
	//getDta
	public SellNowDto getSellNowData(String user_num, String sellnow_num);
	public int getSellNowdSuccessCount(String user_num);
	public SellNowDto getSellNowDataOfSellNowNum(String sellnow_num);

}
