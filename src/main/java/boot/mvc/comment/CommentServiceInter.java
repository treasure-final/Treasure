package boot.mvc.comment;

public interface CommentServiceInter {
	public void insertComment(CommentDto CDto);
	
	public void updateComment(CommentDto CDto);
	public void deleteComment(String comment_id);

}
