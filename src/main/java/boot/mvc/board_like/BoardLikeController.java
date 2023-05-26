package boot.mvc.board_like;

import boot.mvc.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class BoardLikeController {

	@Autowired
	BoardLikeService service;

	@Autowired
	UserService userService;

	@GetMapping("/style/insertLike")
	public String insertBoardLike(String board_id, HttpSession session) {
		String loginEmail = (String) session.getAttribute("loginEmail");
		String user_num = userService.findEmailUserNum(loginEmail);
		BoardLikeDto boardLikeDto=new BoardLikeDto();
		boardLikeDto.setBoard_id(board_id);
		boardLikeDto.setUser_num(user_num);

		service.insertBoardLike(boardLikeDto);

		return "/style/stylelist";
	}

	@GetMapping("/style/deleteLike")
	public String deleteBoardLike(String board_id, HttpSession session) {
		String loginEmail = (String) session.getAttribute("loginEmail");
		String user_num = userService.findEmailUserNum(loginEmail);

		service.deleteBoardLike(board_id,user_num);

		return "/style/stylelist";
	}
}
