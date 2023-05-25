package boot.mvc.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.mvc.buy_bid.BuyBidDto;

@Mapper
public interface BoardMapperInter {
	public List<BoardDto> getAllList();

	public void insertStyle(BoardDto dto);

	public List<BoardDto> getList();

	public void deleteStyle(String board_id);
	
	public int getBoardId(String myid);
	
	List<BoardDto> getListBoard(Map<String, Object> map);
}
