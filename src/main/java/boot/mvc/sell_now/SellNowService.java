package boot.mvc.sell_now;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellNowService implements SellNowServiceInter {

	@Autowired
	SellNowMapperInter mapper;
	
	@Override
	public void insertSellNow(SellNowDto sellNowDto) {
		mapper.insertSellNow(sellNowDto);
	}

	@Override
	public String getNowinsertSellNowNum() {
		return mapper.getNowinsertSellNowNum();
	}

	@Override
	public void updateSellStatusSoldOut(String sellnow_num) {
		mapper.updateSellStatusSoldOut(sellnow_num);
	}

}
