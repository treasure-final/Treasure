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
	public void insertComment(CommentDto CDto) {
		// TODO Auto-generated method stub
		mapper.insertComment(CDto);
	}

	@Override
	public void updateComment(CommentDto CDto) {
		// TODO Auto-generated method stub
		mapper.updateComment(CDto);
		
	}

	@Override

	public String getUserEmailByUserNum(String user_num) {
		// TODO Auto-generated method stub
		return mapper.getUserEmailByUserNum(user_num);
	}

	public void deleteComment(String comment_id) {
		mapper.deleteComment(comment_id);
	}
}
