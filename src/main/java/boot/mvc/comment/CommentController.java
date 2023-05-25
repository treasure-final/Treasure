package boot.mvc.comment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.mvc.board.BoardService;
import boot.mvc.user.UserDto;
import boot.mvc.user.UserService;

@RestController
public class CommentController {

	@Autowired
	CommentService cservice;

	@Autowired
	UserService uservice;

	@Autowired
	BoardService bservice;

	@PostMapping("/comment/insert")
	public String insert(@ModelAttribute CommentDto cdto, HttpSession session, int board_id) {

		String loginEmail = (String) session.getAttribute("loginEmail");
		String user_num = uservice.findEmailUserNum(loginEmail);

		cdto.setMyid(loginEmail);
		cdto.setUser_num(user_num);

		System.out.println(loginEmail);
		System.out.println(user_num);

		cservice.InsertComment(cdto);
		return "redirect:/style/styledetail?board_id=" + board_id;
	}

	@PostMapping("/comment/update")
	public void update(@ModelAttribute CommentDto cdto) {
		cservice.updateComment(cdto);
	}

}
