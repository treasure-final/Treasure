package boot.mvc.style;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.mvc.board.BoardDto;

@Service
public class StyleService implements StyleServiceInter {

	@Autowired
	private StyleMapperInter mapper;

	private Set<String> loadedImages = new HashSet<>();

	@Override
	public List<Map<String, Object>> StyleDetailList() {
		List<Map<String, Object>> styleList = mapper.StyleDetailList();
		loadedImages.clear(); // 이미지 로드 기록 초기화
		return styleList;
	}

	@Override
	public BoardDto getData(int board_id) {
		return mapper.getData(board_id);
	}

	@Override
	public List<Map<String, Object>> selectCommentsByBoardId(int board_id) {
		return mapper.selectCommentsByBoardId(board_id);
	}


	

}
