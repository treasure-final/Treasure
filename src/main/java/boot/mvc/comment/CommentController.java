package boot.mvc.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.user.UserDto;
import boot.mvc.user.UserService;

@Controller
public class CommentController {

	@Autowired
	CommentService Cservice;

	@Autowired
	UserService Uservice;

	@PostMapping("/comment/insert")
	public void insert(@ModelAttribute CommentDto commentDto, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		UserDto userDto = Uservice.getUserNumData(userId);
		String nickname = userDto.getUser_nickname();
		commentDto.setUser_num(userDto.getUser_num());
		Cservice.InsertComment(commentDto);
	}

	@ResponseBody
	@GetMapping("/comment/list")
	public List<Map<String, Object>> getCommentsWithUserInfo(Integer board_id) {
		
	    return Cservice.getCommentsWithUserInfo(board_id);
	}

}
