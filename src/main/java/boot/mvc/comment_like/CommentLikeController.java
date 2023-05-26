package boot.mvc.comment_like;

import boot.mvc.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class CommentLikeController {

	@Autowired
	CommentLikeService service;

	@Autowired
	UserService userService;

	@GetMapping("/comment/insertLike")
	public String insertCommentLike(String comment_id, HttpSession session) {
		String loginEmail = (String) session.getAttribute("loginEmail");
		String user_num = userService.findEmailUserNum(loginEmail);
		CommentLikeDto commentLikeDto=new CommentLikeDto();
		commentLikeDto.setComment_id(comment_id);
		commentLikeDto.setUser_num(user_num);

		service.insertCommentLike(commentLikeDto);

		return "/style/styledetail";
	}

	@GetMapping("/comment/deleteLike")
	public String deleteCommentLike(String comment_id, HttpSession session) {
		String loginEmail = (String) session.getAttribute("loginEmail");
		String user_num = userService.findEmailUserNum(loginEmail);

		service.deleteCommentLike(comment_id,user_num);

		return "/style/styledetail";
	}
}
