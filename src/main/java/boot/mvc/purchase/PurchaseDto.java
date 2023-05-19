package boot.mvc.purchase;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PurchaseDto")
public class PurchaseDto {

	private String purchase_num;
	private String item_num;
	private String buy_bid_num;
	private String selltotal_num;
	private String purchase_addr;
	private int purchase_wishprice;
	private String purchase_delivery;
	private int purchase_total_price;
	private int purchase_status;
	private Timestamp purchase_date;
	
}

