package boot.mvc.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
@Controller
public class PurchaseController {

	@Autowired
	PurchaseService service;
	
}
