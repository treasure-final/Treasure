package boot.mvc.sell_bid;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellBidMapperInter {
	public void insertSellBid(SellBidDto SellBidDto);
	public String getNowinsertSellBidNum();
	public SellBidDto getSellBidData(String user_num, String sell_num);

}
