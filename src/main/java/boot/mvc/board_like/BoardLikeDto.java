package boot.mvc.board_like;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BoardLikeDto")
public class BoardLikeDto {
private int board_like_id;
private int board_id;
private int user_num;
}
