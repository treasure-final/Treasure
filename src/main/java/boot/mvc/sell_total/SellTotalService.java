package boot.mvc.sell_total;

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
	


}
