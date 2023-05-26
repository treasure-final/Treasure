package boot.mvc.comment_like;

import java.util.Map;

public interface CommentLikeServiceInter {
    public void insertCommentLike(CommentLikeDto commentLikeDto);
    public void deleteCommentLike(String comment_id,String user_num);
    public int boardCommentCheck(String comment_id,String user_num);
}
