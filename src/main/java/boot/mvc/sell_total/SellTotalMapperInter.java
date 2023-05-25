package boot.mvc.sell_total;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SellTotalMapperInter {
	
	public void insertSellNow(SellTotalDto sellTotalDto);
	public String getNowinsertSellTotalNum();
	List<SellTotalDto> getListSellTotal(Map<String, Object> map);
	public int getTotalSellCount(String user_num);

}
