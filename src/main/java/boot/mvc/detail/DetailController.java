package boot.mvc.detail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DetailController {

	@GetMapping("/item/detail")
	public String detail() {
		return "/item/detail";
	}
}
