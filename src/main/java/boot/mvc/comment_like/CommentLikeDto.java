package boot.mvc.comment_like;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CommentLikeDto")
public class CommentLikeDto {
    private String comment_like_id;
    private String comment_id;
    private String user_num;
}
