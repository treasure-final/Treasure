package boot.mvc.sell_total;

import java.util.List;

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
	public List<SellTotalDto> getListSellTotal(String user_num) {
		// TODO Auto-generated method stub
		return mapper.getListSellTotal(user_num);
	}

	
	


}
