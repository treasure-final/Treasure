package boot.mvc.comment;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CommentDto")
public class CommentDto {
	private String comment_id;
	private String comment_content;
	private String user_num;
	private String board_id;
	private String myid;
	private Timestamp comment_writeday;
	private int boardLikeCheck;
}
