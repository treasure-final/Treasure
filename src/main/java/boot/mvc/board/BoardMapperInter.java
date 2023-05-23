package boot.mvc.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapperInter {
	public List<BoardDto> getAllList();
}
