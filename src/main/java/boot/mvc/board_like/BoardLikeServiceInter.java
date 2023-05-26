package boot.mvc.board_like;

import java.util.List;
import java.util.Map;

public interface BoardLikeServiceInter {
    public void insertBoardLike(BoardLikeDto boardLikeDto);
    public void deleteBoardLike(String board_id, String user_num);
    public int boardLikeCheck(String board_id, String user_num);
}