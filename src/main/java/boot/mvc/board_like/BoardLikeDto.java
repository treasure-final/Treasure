package boot.mvc.board_like;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BoardLikeDto")
public class BoardLikeDto {
	private String board_like_id;
	private String board_id;
	private String user_num;
}
