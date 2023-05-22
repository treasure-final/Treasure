package boot.mvc.sell_total;

import org.apache.ibatis.type.Alias;

import boot.mvc.buy_bid.BuyBidDto;
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
	private ItemDto itemDto;
	private SellTotalDto sellTotalDto;
	private SellNowDto sellNowDto;
	private SellBidDto sellBidDto;
	private BuyBidDto bydBidDto;
	
	
	public ItemDto getItemDto() {
		return itemDto;
	}
	public void setItemDto(ItemDto itemDto) {
		this.itemDto = itemDto;
	}
	public SellTotalDto getSellTotalDto() {
		return sellTotalDto;
	}
	public void setSellTotalDto(SellTotalDto sellTotalDto) {
		this.sellTotalDto = sellTotalDto;
	}
	public SellNowDto getSellNowDto() {
		return sellNowDto;
	}
	public void setSellNowDto(SellNowDto sellNowDto) {
		this.sellNowDto = sellNowDto;
	}
	public SellBidDto getSellBidDto() {
		return sellBidDto;
	}
	public void setSellBidDto(SellBidDto sellBidDto) {
		this.sellBidDto = sellBidDto;
	} 
	public BuyBidDto getBydBidDto() {
		return bydBidDto;
	}
	public void setBydBidDto(BuyBidDto bydBidDto) {
		this.bydBidDto = bydBidDto;
	} 
	
	
	
	
	
}
