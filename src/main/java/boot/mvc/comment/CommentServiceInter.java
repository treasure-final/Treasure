package boot.mvc.comment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CommentServiceInter {
	public void InsertComment(CommentDto CDto);
	
	 List<Map<String, Object>> getCommentsByBoardId(@Param("board_id") int board_id);

}
