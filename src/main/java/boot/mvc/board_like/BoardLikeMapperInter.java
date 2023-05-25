package boot.mvc.board_like;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardLikeMapperInter {

	
	public void findLike(int board_num,int user_num);
}
