package boot.mvc.sell_total;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SellTotalMapperInter {
	
	public void insertSellNow(SellTotalDto sellTotalDto);
	public String getNowinsertSellTotalNum();
	List<SellTotalDto> getListSellTotal(String user_num);

}
