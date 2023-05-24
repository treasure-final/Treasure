package boot.mvc.style;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@Controller
public class StyleController {

	@Autowired
	StyleService SDservice;

	@GetMapping("/style/detail")
	public ModelAndView detail(int board_id) {
		ModelAndView mview = new ModelAndView();

		List<Map<String, Object>> DetailList = SDservice.StyleDetailList();
		BoardDto bdto = SDservice.getData(board_id);

		mview.addObject("DetailList", DetailList);
		mview.addObject("bdto", bdto);

		mview.setViewName("/style/styledetail");

		return mview;
	}
	@GetMapping("/style/comments/{board_id}")
    @ResponseBody
    public ResponseEntity<List<Map<String, Object>>> getCommentsByBoardId(@PathVariable("board_id") int board_id) {
        List<Map<String, Object>> comments = SDservice.selectCommentsByBoardId(board_id);
        return ResponseEntity.ok(comments);
    }

	@GetMapping("/load-more-data")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> loadMoreData(@RequestParam("page") int page) {
		// 페이지에 따른 추가 데이터 로드
		List<String> data = loadData(page);

		// 응답 데이터 생성
		Map<String, Object> response = new HashMap<>();
		response.put("data", data);

		return ResponseEntity.ok(response);
	}

	// 페이지에 따른 데이터 로드하는 메서드
	// (가정)
	private List<String> loadData(int page) {
		int pageSize = 10; // 한 페이지에 보여줄 아이템수
		int offset = (page - 1) * pageSize; // 페이지에 해당하는 데이터의 시작 인덱스
		List<String> data = new ArrayList<>();
		for (int i = offset; i < offset + pageSize; i++) {
			data.add("Item " + (i + 1));
		}

		return data;
	}

}
