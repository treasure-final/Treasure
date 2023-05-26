package boot.mvc.comment_like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class CommentLikeService implements CommentLikeServiceInter {

	@Autowired
	CommentLikeMapperInter mapper;

	@Override
	public void insertCommentLike(CommentLikeDto commentLikeDto) {
		mapper.insertCommentLike(commentLikeDto);
	}

	@Override
	public void deleteCommentLike(String comment_id, String user_num) {
		Map<String,String> map=new HashMap<>();
		map.put("comment_id",comment_id);
		map.put("user_num",user_num);
		mapper.deleteCommentLike(map);
	}

	@Override
	public int boardCommentCheck(String comment_id, String user_num) {
		Map<String,String> map=new HashMap<>();
		map.put("comment_id",comment_id);
		map.put("user_num",user_num);
		return mapper.boardCommentCheck(map);
	}
}
