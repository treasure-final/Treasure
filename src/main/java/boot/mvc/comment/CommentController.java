package boot.mvc.comment;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public void insert(@ModelAttribute CommentDto Cdto, HttpSession session) {
		String userid = (String) session.getAttribute("");

		UserDto udto = Uservice.getUserNumData(userid);

		String nickname = udto.getUser_nickname();

		Cservice.InsertComment(Cdto);
	}

	@GetMapping("/board/comment")
	public String comment(Model model, @RequestParam("board_id") String boardId) {
	    // 댓글 조회 기능 사용 예시
	    List<CommentDto> comments = Cservice.getCommentsByBoardId(boardId);
	    
	    model.addAttribute("comments", comments);

	    return "/style/styledetail";
	}

}
