package boot.mvc.purchase;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PurchaseDto")
public class PurchaseDto {

	private String purchase_num;
	private String item_num;
	private String purchase_buy;
	private String purchase_sell;
	private String buybid_num;
	private String purchase_addr;
	private int purchase_price;
	private String purchase_delivery;
	private int purchase_total_price;
	private Timestamp purchase_date;
	
}
