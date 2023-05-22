package boot.mvc.buy_now;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuyNowService implements BuyNowServiceInter {

	@Autowired
    BuyNowMapperInter mapper;
	
}
