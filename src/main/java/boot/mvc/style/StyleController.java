package boot.mvc.style;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.board.BoardDto;
import boot.mvc.board.BoardService;
import boot.mvc.user.UserService;

@Controller
public class StyleController {

	@Autowired
	StyleService SDservice;

	@Autowired
	BoardService Bservice;

	@Autowired
	UserService uservice;

	private static final int PAGE_SIZE = 10; // 페이지당
												// 아이템
												// 수

	@GetMapping("/style/detail")
	public ModelAndView detail(int board_id, @RequestParam(defaultValue = "0") int offset) {
		ModelAndView mview = new ModelAndView();

		List<BoardDto> list=Bservice.getList();
		for (BoardDto boarddto : list) {
			
        }
		
		List<Map<String, Object>> DetailList = SDservice.StyleDetailList();
		BoardDto bdto = SDservice.getData(board_id);
		List<BoardDto> blist = Bservice.getList();

		mview.addObject("DetailList", DetailList);
		mview.addObject("bdto", bdto);
		mview.addObject("blist", blist);

		mview.setViewName("/style/styledetail");

		return mview;
	}

	@GetMapping("/style/comments/{board_id}")
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> getCommentsByBoardId(@PathVariable("board_id") int board_id) {
		List<Map<String, Object>> comments = SDservice.selectCommentsByBoardId(board_id);
		return ResponseEntity.ok(comments);
	}

}