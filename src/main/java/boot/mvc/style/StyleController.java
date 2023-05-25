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
import boot.mvc.buy_bid.BuyBidDto;
import boot.mvc.item.ItemDto;
import boot.mvc.user.UserService;

@Controller
public class StyleController {

	@Autowired
	StyleService SDservice;

	@Autowired
	BoardService Bservice;

	@Autowired
	UserService uservice;

	@GetMapping("/style/detail")
	public ModelAndView detail(int board_id, @RequestParam(defaultValue = "0") int offset) {
	    ModelAndView mview = new ModelAndView();

	    List<Map<String, Object>> DetailList = SDservice.StyleDetailList();
	    List<BoardDto> list = Bservice.getListBoard(board_id, offset);
	    

	    BoardDto bdto = SDservice.getData(board_id);
	    List<BoardDto> blist = Bservice.getList();

	    mview.addObject("offset", offset);
	    mview.addObject("list", list);
	    mview.addObject("DetailList", DetailList);
	    mview.addObject("bdto", bdto);
	    mview.addObject("blist", blist);

	    mview.setViewName("/style/styledetail");

	    return mview;
	}

	// 리스트 무한스크롤 ajax
		@GetMapping("/style/styleDetailScroll")
		@ResponseBody
		public List<BoardDto> styleDetailScroll(int board_id,int offset) {

			List<BoardDto> list = Bservice.getListBoard(board_id, offset);
			
			return list;
		}

	@GetMapping("/style/comments/{board_id}")
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> getCommentsByBoardId(@PathVariable("board_id") int board_id) {
		List<Map<String, Object>> comments = SDservice.selectCommentsByBoardId(board_id);
		return ResponseEntity.ok(comments);
	}

}