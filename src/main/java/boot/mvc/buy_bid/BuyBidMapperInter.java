package boot.mvc.buy_bid;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BuyBidMapperInter {
	
    public void insertBuyBid(BuyBidDto buyBidDto);
    public BuyBidDto getBuyBidForSellNow(HashMap<String,Object> map);
    public BuyBidDto getDataOfBuyBid(String buy_num);
    
}
