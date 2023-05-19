package boot.mvc.sell_total;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("MySellTotalDto")
public class MySellTotalDto {
	
	private String item_num;
	private String item_engname;
	private String item_korname;
	private String item_modelnum;
	private String item_image;
	private String name;
	private String addr;
	private String phone;
	private String bank_name;
	private String bank_number;
	private String card_name;
	private String card_number;
	private String wishprice;
	private String totalprice;
	private String size;
	private String deadline;
	
}
