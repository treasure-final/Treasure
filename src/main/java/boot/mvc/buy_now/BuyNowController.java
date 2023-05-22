package boot.mvc.buy_now;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BuyNowController {

	@Autowired
    BuyNowService service;
	
}
