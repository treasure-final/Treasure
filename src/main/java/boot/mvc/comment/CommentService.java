package boot.mvc.comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.mvc.user.UserDto;

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
	public List<Map<String, Object>> getCommentsWithUserInfo(String board_id) {
		// TODO Auto-generated method stub
		return mapper.getCommentsWithUserInfo(board_id);
	}


}
