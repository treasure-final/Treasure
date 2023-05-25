package boot.mvc.style;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.mvc.board.BoardDto;

@Mapper
public interface StyleMapperInter {

	public List<Map<String, Object>> StyleDetailList();

	public BoardDto getData(int board_id);

	public List<Map<String, Object>> selectCommentsByBoardId(int board_id);
	
	public List<BoardDto> getListBoard(Map<String, Integer> map);

}
