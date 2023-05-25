package boot.mvc.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface BoardMapperInter {
    public List<BoardDto> getAllList();

    public void insertStyle(BoardDto dto);

    public List<BoardDto> getList();

    public void deleteStyle(String board_id);

    public Map<String, String> getBoardId(int board_id);

    public List<BoardDto> getListBoard(Map<String, Object> map);

    public String getBoardDtoByUserNum(String user_num);

}
