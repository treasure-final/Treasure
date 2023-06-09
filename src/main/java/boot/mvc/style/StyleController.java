package boot.mvc.style;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boot.mvc.board_like.BoardLikeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.board.BoardDto;
import boot.mvc.board.BoardService;
import boot.mvc.user.UserService;

@Controller
public class StyleController {

	@Autowired
	StyleService Sservice;

	@Autowired
	BoardService Bservice;

	@Autowired
	UserService uservice;

	@Autowired
	BoardLikeService boardLikeService;

	@GetMapping("/style/detail")
	public ModelAndView detail(HttpSession session) {
		ModelAndView mview = new ModelAndView();
		String loginEmail = (String) session.getAttribute("loginEmail");
		String user_num = uservice.findEmailUserNum(loginEmail);

		// 모든 게시글 정보가 담긴 리스트
//		BoardDto bdto = Sservice.getData(board_id);
		List<BoardDto> blist = Bservice.getList();

		// StyleDetailList() -> 각 user에 따른 게시글 정보가 담긴 Map을 List로 감쌌다.
		List<Map<String, Object>> DetailList = Sservice.StyleDetailList();
		for(int i=0; i<blist.size(); i++) {
			blist.get(i).setBoardLikeCheck(boardLikeService.boardLikeCheck(blist.get(i).getBoard_id(),user_num));
		}
		mview.addObject("DetailList", DetailList);
//		mview.addObject("bdto", bdto);
		mview.addObject("blist", blist);

		mview.setViewName("/style/styledetail");

		return mview;
	}

	@GetMapping("/style/comments/{board_id}")
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> getCommentsByBoardId(@PathVariable("board_id") int board_id, Model model) {
		List<Map<String, Object>> comments = Sservice.selectCommentsByBoardId(board_id);
		List<Object> commentList = new ArrayList<>();
		for(int i=0; i<comments.size(); i++) {
			Map<String,Object> m=comments.get(i);
			commentList.add(m.get("comment_id"));
		}
		model.addAttribute("commentList", commentList);
		return ResponseEntity.ok(comments);
	}
}


