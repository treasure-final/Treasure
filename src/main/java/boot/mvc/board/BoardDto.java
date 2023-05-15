package boot.mvc.board;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("BoardDto")
public class BoardDto {
private int board_id;	
private int user_num;

private String board_content;
private String board_image;
private int board_like_count;
private int board_comment_count;
private Date board_writeday; 
}
