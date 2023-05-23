package boot.mvc.sell_bid;


import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(pattern = "yyyy/MM/dd" , timezone = "Asia/Seoul")
	private Timestamp sell_inputday;
	private String sell_addr;
	private String sell_status;
	private String test_result;
	private ItemDto itemDto;
	private String return_name;
	private String return_phone;
	private String return_addr;
	private String account_bank;
	private String account_number;
	private String penaltypay_bank;
	private String penaltypay_number;
	
	 public ItemDto getItemDto() {
	        return itemDto;
	    }

	    public void setItemDto(ItemDto itemDto) {
	        this.itemDto = itemDto;
	    }
}
