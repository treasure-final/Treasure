package boot.mvc.buy_bid;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BuyBidMapperInter {
    public void insertBuyBid(BuyBidDto buyBidDto);
}
