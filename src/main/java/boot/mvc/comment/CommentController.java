package boot.mvc.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.user.UserDto;
import boot.mvc.user.UserService;

@RestController
public class CommentController {

	@Autowired
	CommentService Cservice;

	@Autowired
	UserService Uservice;

	@RequestMapping("/comment/load-comments")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> loadComments(@RequestParam("board_id") int board_id) {
        // 댓글 정보 조회
        List<Map<String, Object>> commentList = Cservice.getCommentsByBoardId(board_id);
        
        // 응답 데이터 생성
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("comments", commentList);
        
        // JSON 형태로 응답
        return ResponseEntity.ok(responseData);
    }

}
