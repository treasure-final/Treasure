package boot.mvc.buy_bid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuyBidService implements BuyBidServiceInter {

	@Autowired
	BuyBidMapperInter mapper;

}
