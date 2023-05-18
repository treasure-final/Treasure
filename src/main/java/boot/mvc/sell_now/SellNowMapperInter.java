package boot.mvc.sell_now;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellNowMapperInter {

	public void insertSellNow(SellNowDto sellNowDto);
	public String getNowinsertSellNowNum();
	public void updateSellStatusSoldOut(String sellnow_num);	

}
