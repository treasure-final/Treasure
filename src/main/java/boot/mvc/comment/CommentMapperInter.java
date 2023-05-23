package boot.mvc.comment;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapperInter {
	
	public void InsertComment(CommentDto CDto);
	
	 List<Map<String, Object>> getCommentsWithUserInfo(String board_id);
	
	
}
