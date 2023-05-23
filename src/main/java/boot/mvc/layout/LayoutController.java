package boot.mvc.layout;

import boot.mvc.item.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class LayoutController {

	@Autowired
	ItemService itemService;
	
	@GetMapping("/")
	public String start()
	{
		List<String> items = new ArrayList<>();
		for(int i=0; i<12; i++) {
//			int num = (int)(Math.random() * 100)+ items)
		}

//		itemService.getItemData();

		return "/layout/main";
	}
}
