package boot.mvc.board_like;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BoardLikeMapperInter {

	public void insertBoardLike(BoardLikeDto boardLikeDto);
	public void deleteBoardLike(Map<String,String> map);
	public List<BoardLikeDto> getUsersBoardLike(String user_num);
	public int boardLikeCheck(Map<String,String> map);
}
