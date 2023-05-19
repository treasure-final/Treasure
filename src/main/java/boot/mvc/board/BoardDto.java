package boot.mvc.board;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("BoardDto")
public class BoardDto {
private int board_id;	
private int user_num;
private int item_num;
private String board_content;
private String board_image;
private int board_like_count;
private int board_comment_count;
private String board_subject;
private Date board_writeday; 
private String myid;
private String name;
private MultipartFile upload; 
private String myphoto;
}
