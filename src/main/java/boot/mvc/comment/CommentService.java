package boot.mvc.comment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService implements CommentServiceInter {

	@Autowired
	CommentMapperInter mapper;

	@Override
	public void InsertComment(CommentDto CDto) {
		// TODO Auto-generated
		// method stub
		mapper.InsertComment(CDto);
	}

	@Override
	public List<Map<String, Object>> getCommentsByBoardId(int board_id) {
		// TODO Auto-generated method stub
		return mapper.getCommentsByBoardId(board_id);
	}


	


}
