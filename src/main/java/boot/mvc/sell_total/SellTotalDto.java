package boot.mvc.sell_total;

import org.apache.ibatis.type.Alias;

import boot.mvc.item.ItemDto;
import boot.mvc.sell_bid.SellBidDto;
import boot.mvc.sell_now.SellNowDto;
import lombok.Data;

@Data
@Alias("SellTotalDto")
public class SellTotalDto {
	
	private String selltotal_num;
	private String user_num;
	private String sell_num; 
	private String sellnow_num;
	private SellNowDto sellNowDto;
	private SellBidDto sellBidDto;
	private ItemDto itemDto;
	
	 public ItemDto getItemDto() {
	        return itemDto;
	    }

	    public void setItemDto(ItemDto itemDto) {
	        this.itemDto = itemDto;
	    }
	
}
