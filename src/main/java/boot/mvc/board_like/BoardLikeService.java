
package boot.mvc.board_like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardLikeService implements BoardLikeServiceInter {

	@Autowired
	BoardLikeMapperInter mapper;

	@Override
	public void insertBoardLike(BoardLikeDto boardLikeDto) {
		mapper.insertBoardLike(boardLikeDto);
	}

	@Override
	public void deleteBoardLike(String board_id, String user_num) {

		Map<String, String> map = new HashMap<>();
		map.put("board_id", board_id);
		map.put("user_num", user_num);
		mapper.deleteBoardLike(map);
	}

	@Override
	public int boardLikeCheck(String board_id, String user_num) {
		Map<String, String> map = new HashMap<>();
		map.put("board_id", board_id);
		map.put("user_num", user_num);
		return mapper.boardLikeCheck(map);
	}

}
