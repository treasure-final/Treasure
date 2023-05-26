package boot.mvc.comment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import boot.mvc.board.BoardDto;
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
	@ResponseBody
	public String insert(@ModelAttribute CommentDto cdto, String board_id, String comment_content,
						 HttpSession session) {

		String loginEmail = (String) session.getAttribute("loginEmail");
		String user_num = uservice.findEmailUserNum(loginEmail);

		cdto.setBoard_id(board_id);
		cdto.setMyid(loginEmail);
		cdto.setUser_num(user_num);
		cdto.setComment_content(comment_content);

		System.out.println(board_id);
		System.out.println(loginEmail);
		System.out.println(user_num);

		cservice.insertComment(cdto);
		return board_id;
	}

	@PostMapping("/comment/update")
	public void update(@ModelAttribute CommentDto cdto) {
		cservice.updateComment(cdto);
	}

	@GetMapping("/comment/deletecomment")
	public String deleteComment(String comment_id) {
		System.out.println(comment_id);

		return "/style/styledetail";
	}
}
