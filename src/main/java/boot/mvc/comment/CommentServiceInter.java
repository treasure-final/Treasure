package boot.mvc.comment;

import java.util.List;
import java.util.Map;

public interface CommentServiceInter {
	public void InsertComment(CommentDto CDto);

	List<Map<String, Object>> getCommentsWithUserInfo(Integer board_id);

}
