package boot.mvc.board_like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardLikeController {

	@Autowired
	BoardLikeService service;
	
}
