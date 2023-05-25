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
	public String getBoardDtoByUserNum(String user_num) {
		// TODO Auto-generated method stub
		return mapper.getBoardDtoByUserNum(user_num);
	}

}