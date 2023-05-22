package boot.mvc.comment;

import java.util.List;

public interface CommentServiceInter {
	public void InsertComment(CommentDto CDto);

	public List<CommentDto> getCommentsByBoardId(String boardId);
}
