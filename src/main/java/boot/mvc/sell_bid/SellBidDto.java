package boot.mvc.sell_bid;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("SellBidDto")
public class SellBidDto {
	
	private int sell_num;
	private int user_num;
	private int item_num;
	private int sell_wishprice;
	private String sell_acount;
	private String sell_penaltypay; 
	private String sell_size;
	private String sell_addr;
	private String sell_status;
	private int sell_deadline;
	private Timestamp sell_inputday;
}
