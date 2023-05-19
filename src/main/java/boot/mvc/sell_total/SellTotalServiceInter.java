package boot.mvc.sell_total;

import java.util.List;

public interface SellTotalServiceInter {

	public void insertSellNow(SellTotalDto sellTotalDto);
	public String getNowinsertSellTotalNum();
	public List<SellTotalDto> getListSellTotal(String user_num);
	
}
