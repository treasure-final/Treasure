package boot.mvc.style;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.board.BoardDto;
import boot.mvc.board.BoardService;
import boot.mvc.board_like.BoardLikeService;
import boot.mvc.comment.CommentDto;
import boot.mvc.comment.CommentService;
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
	CommentService cservice;
	
	@Autowired
	BoardLikeService boardLikeService;

	@GetMapping("/style/detail")
	public ModelAndView detail(@ModelAttribute CommentDto cdto, int board_id, HttpSession session) {
		ModelAndView mview = new ModelAndView();

		String myid = (String) session.getAttribute("loginEmail");
		String user_num = uservice.findEmailUserNum(myid);

		BoardDto bdto = Sservice.getData(board_id);
		List<BoardDto> blist = Bservice.getList();

		List<Map<String, Object>> DetailList = Sservice.StyleDetailList();
		for(int i=0; i<blist.size(); i++) {
			blist.get(i).setBoardLikeCheck(boardLikeService.boardLikeCheck(blist.get(i).getBoard_id(),user_num));
		}

		mview.addObject("user_num",user_num);
		mview.addObject("myid", myid);
		mview.addObject("DetailList", DetailList);
		mview.addObject("bdto", bdto);
		mview.addObject("blist", blist);

		mview.setViewName("/style/styledetail");

		return mview;
	}

	@GetMapping("/style/comments/{board_id}")
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> getCommentsByBoardId(@PathVariable("board_id") int board_id) {
		List<Map<String, Object>> comments = Sservice.selectCommentsByBoardId(board_id);
		return ResponseEntity.ok(comments);
	}

}
