package boot.mvc.buy_bid;

import boot.mvc.item.ItemDto;
import org.apache.ibatis.type.Alias;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;
import java.sql.Timestamp;

@Data
@Alias("BuyBidDto")
public class BuyBidDto {
    private String buy_num;
    private String item_num;
    private String user_num;
    private String buy_wishprice;
    private String buy_size;
    private String buy_addr;
    private int buy_deadline;
    private Timestamp buy_inputday;
    private Timestamp buy_modifyday;
    private ItemDto itemDto;
    public ItemDto getItemDto() {
        return itemDto;
    }
    public void setItemDto(ItemDto itemDto) {
        this.itemDto = itemDto;
    }
}
