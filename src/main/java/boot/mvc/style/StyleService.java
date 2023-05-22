package boot.mvc.style;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.mvc.board.BoardDto;


@Service
public class StyleService implements StyleServiceInter {

	@Autowired
	StyleMapperInter mapper;

	@Override
	public List<Map<String, Object>> StyleDetailList() {
		// TODO Auto-generated method stub
		return mapper.StyleDetailList();
	}
}
