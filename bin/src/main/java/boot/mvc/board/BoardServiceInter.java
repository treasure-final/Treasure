package boot.mvc.board;

import java.util.List;

public interface BoardServiceInter {
    public void insertStyle(BoardDto dto);
    public List<BoardDto> getList();

}