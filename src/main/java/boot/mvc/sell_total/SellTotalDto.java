package boot.mvc.sell_total;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("SellTotalDto")
public class SellTotalDto {
	
	private String selltotal_num;
	private String user_num;
	private String sell_num; 
	private String sellnow_num;

}
