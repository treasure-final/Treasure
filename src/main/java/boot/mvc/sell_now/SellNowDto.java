package boot.mvc.sell_now;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("SellNowDto")
public class SellNowDto {
	
	private String sellnow_num; 
	private String user_num;
	private String item_num;
	private String buy_num;
	private String sellnow_totalprice;
	private String sellnow_account;
	private String sellnow_penaltypay;
	private String sellnow_addr;
	private String sell_status;
	private String test_result;

}
