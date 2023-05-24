package boot.mvc.style;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.mvc.board.BoardDto;


@Service
public class StyleService implements StyleServiceInter {

	@Autowired
	StyleMapperInter mapper;

	@Override
	public List<Map<String, Object>> StyleDetailList() {
		// TODO Auto-generated method stub
		return mapper.StyleDetailList();
	}

	@Override
	public BoardDto getData(int board_id) {
		// TODO Auto-generated method stub
		return mapper.getData(board_id);
	}

	@Override
	public List<Map<String, Object>> selectCommentsByBoardId(int board_id) {
		// TODO Auto-generated method stub
		return mapper.selectCommentsByBoardId(board_id);
	}
}
