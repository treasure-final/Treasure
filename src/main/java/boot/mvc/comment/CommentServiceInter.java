package boot.mvc.comment;

import java.util.List;
import java.util.Map;

public interface CommentServiceInter {
	public void InsertComment(CommentDto CDto);
	
	public void updateComment(CommentDto CDto);
	
	public String getUserEmailByUserNum(String user_num);
	
	
}
