package boot.mvc.sell_total;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellTotalService implements SellTotalServiceInter {

	@Autowired
	SellTotalMapperInter mapper;

	@Override
	public void insertSellNow(SellTotalDto sellTotalDto) {
		mapper.insertSellNow(sellTotalDto);		
	}

	@Override
	public String getNowinsertSellTotalNum() {
		return mapper.getNowinsertSellTotalNum();
	}

	@Override
	public List<SellTotalDto> getListSellTotal(String user_num, int offset) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
	    map.put("user_num", user_num);
	    map.put("offset", offset);
	    return mapper.getListSellTotal(map);
	}

	@Override
	public int getTotalSellCount(String user_num) {
		// TODO Auto-generated method stub
		return mapper.getTotalSellCount(user_num);
	}


	

}
