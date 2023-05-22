package boot.mvc.board_like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardLikeService implements BoardLikeServiceInter {

	@Autowired
	BoardLikeMapperInter mapper;

}
