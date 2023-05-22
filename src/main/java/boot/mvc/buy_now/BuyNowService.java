package boot.mvc.buy_now;

import boot.mvc.sell_bid.SellBidDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuyNowService implements BuyNowServiceInter {

	@Autowired
    BuyNowMapperInter mapper;

    @Override
    public List<SellBidDto> getBuyNowPrice(String item_num) {
        return mapper.getBuyNowPrice(item_num);
    }

    @Override
    public List<BuyNowDto> getDataByStatus0(String user_num) {
        return mapper.getDataByStatus0(user_num);
    }

    @Override
    public List<BuyNowDto> getDataByStatus1(String user_num) {
        return mapper.getDataByStatus1(user_num);
    }
}
