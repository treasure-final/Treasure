package boot.mvc.board;

import java.util.List;

public interface BoardServiceInter {
   public void insertStyle(BoardDto dto);
   public List<BoardDto> getList();
   public void deleteStyle(String board_id);
   public List<BoardDto> getListBoard(int board_id, int offset);

}