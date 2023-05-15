package boot.mvc.sell_bid;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("SellBidDto")
public class SellBidDto {
	
	private String sell_num;
	private String user_num;
	private String item_num;
	private String sell_acount;
	private String sell_penaltypay; 
	private int sell_wishprice;
	private int sell_totalprice;
	private String sell_size;
	private int sell_deadline;
	private Timestamp sell_inputday;
	private String sell_addr;
	private String sell_status;
	private String test_result;
	
}
