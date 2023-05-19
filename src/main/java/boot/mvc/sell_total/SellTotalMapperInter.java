package boot.mvc.sell_total;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellTotalMapperInter {
	
	public void insertSellNow(SellTotalDto sellTotalDto);
	public String getNowinsertSellTotalNum();

}
