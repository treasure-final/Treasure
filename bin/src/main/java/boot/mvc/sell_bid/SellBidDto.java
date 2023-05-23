package boot.mvc.sell_bid;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import boot.mvc.item.ItemDto;
import lombok.Data;

@Data
@Alias("SellBidDto")
public class SellBidDto {
	
	private String sell_num;
	private String user_num;
	private String item_num;
	private String sell_account;
	private String sell_penaltypay; 
	private int sell_wishprice;
	private int sell_totalprice;
	private String sell_size;
	private int sell_deadline;
	private Timestamp sell_inputday;
	private String sell_addr;
	private String sell_status;
	private String test_result;
	private ItemDto itemDto;
	
	 public ItemDto getItemDto() {
	        return itemDto;
	    }

	    public void setItemDto(ItemDto itemDto) {
	        this.itemDto = itemDto;
	    }
}
