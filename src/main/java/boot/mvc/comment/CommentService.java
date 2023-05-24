package boot.mvc.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService implements CommentServiceInter {

	@Autowired
	CommentMapperInter mapper;

	@Override
	public void InsertComment(CommentDto CDto) {
		// TODO Auto-generated method stub
		mapper.insertComment(CDto);
	}
}
