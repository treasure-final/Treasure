package boot.mvc.comment;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapperInter {
	
	public void insertComment(CommentDto CDto);
	
	public void updateComment(CommentDto CDto);
	
	
}
