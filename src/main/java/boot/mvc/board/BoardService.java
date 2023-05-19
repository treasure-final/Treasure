package boot.mvc.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService implements BoardServiceInter {

	@Autowired
	BoardMapperInter mapper;

	@Override
	public void insertStyle(BoardDto dto) {
		// TODO Auto-generated method stub
		mapper.insertStyle(dto);
	}

	@Override
	public List<BoardDto> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

}