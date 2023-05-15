package boot.mvc.style;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StyleController {

	@GetMapping("/style/styleDetail")
	public String detail()
	{
		return "/style/styleDetail";
	}
}
