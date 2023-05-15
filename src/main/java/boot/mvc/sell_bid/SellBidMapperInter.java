package boot.mvc.sell_bid;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellBidMapperInter {
	public void insertSellBid(SellBidDto SellBidDto);

}
