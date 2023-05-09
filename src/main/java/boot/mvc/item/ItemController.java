package boot.mvc.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
@Controller
public class ItemController {

	@Autowired
	ItemService service;

}
