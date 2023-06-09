package boot.mvc.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BoardService implements BoardServiceInter {

	@Autowired
	BoardMapperInter mapper;

	@Override
	public void insertStyle(BoardDto dto) {

		mapper.insertStyle(dto);
	}

	@Override
	public List<BoardDto> getList() {

		return mapper.getList();
	}

	@Override
	public void deleteStyle(String board_id) {
		// TODO Auto-generated
		// method stub
		mapper.deleteStyle(board_id);
	}

	@Override
	public Map<String, String> getBoardId(int board_id) {
		return mapper.getBoardId(board_id);
	}

	@Override
	public List<BoardDto> getListBoard(int board_id, int offset) {
		Map<String,Object> map=new HashMap<>();
		map.put("board_id",board_id);
		map.put("offset",offset);
		return mapper.getListBoard(map);
	}

	@Override
	public String getBoardDtoByUserNum(String user_num) {
		// TODO Auto-generated method stub
		return mapper.getBoardDtoByUserNum(user_num);
	}

}