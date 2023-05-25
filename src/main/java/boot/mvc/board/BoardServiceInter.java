package boot.mvc.board;

import java.util.List;
import java.util.Map;

import boot.mvc.buy_bid.BuyBidDto;

public interface BoardServiceInter {
   public void insertStyle(BoardDto dto);
   public List<BoardDto> getList();
   public void deleteStyle(String board_id);
   public int getBoardId(String myid);
   public List<BoardDto> getListBoard(int board_id, int offset);

}