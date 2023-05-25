package boot.mvc.style;

import java.util.List;
import java.util.Map;

import boot.mvc.board.BoardDto;

public interface StyleServiceInter {
	public List<Map<String, Object>> StyleDetailList();
	
	public BoardDto getData(int board_id);
	
	public List<Map<String, Object>> selectCommentsByBoardId(int board_id);
	
	public List<BoardDto> getListBoard(int board_id, int offset);
}
