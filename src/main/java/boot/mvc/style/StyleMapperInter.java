package boot.mvc.style;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.mvc.board.BoardDto;

@Mapper
public interface StyleMapperInter {

	public List<Map<String, Object>> StyleDetailList();
}
