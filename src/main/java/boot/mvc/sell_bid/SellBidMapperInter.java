package boot.mvc.sell_bid;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellBidMapperInter {

	public void insertSellBid(SellBidDto SellBidDto);
	public String getNowinsertSellBidNum();
	public List<SellBidDto> getSellPriceListByitemNum(String item_num);
	public SellBidDto getSellBidData(String user_num, String sell_num);
	public int getSellBidCount(String user_num);
	public int getSellBidSuccessCount(String user_num);
}
