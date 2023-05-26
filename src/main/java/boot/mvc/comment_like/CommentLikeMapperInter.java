package boot.mvc.comment_like;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface CommentLikeMapperInter {
    public void insertCommentLike(CommentLikeDto commentLikeDto);
    public void deleteCommentLike(Map<String,String> map);
    public int boardCommentCheck(Map<String,String> map);
}
