package boot.mvc.buy_bid;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BuyBidMapperInter {
	
    public void insertBuyBid(BuyBidDto buyBidDto);
    public BuyBidDto getBuyBidForSellNow(HashMap<String,Object> map);
    public BuyBidDto getDataOfBuyBid(String buy_num);
    public void updateBuyStatus(String buy_num);
    public List<BuyBidDto> getBuyBidData(String user_num);
    public List<BuyBidDto> getItemInfoByBuyBid(String user_num);
    List<BuyBidDto> getListBuyBidTotal(Map<String, Object> map);
    public int getTotalBuyBidCount(String user_num);

}
