package boot.mvc.comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapperInter {
	
	public void InsertComment(CommentDto CDto);
	
	public List<CommentDto> getCommentsByBoardId(String boardId);
	
}
