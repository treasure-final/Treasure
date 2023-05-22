package boot.mvc.order;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Data
@Alias("OrderDto")
public class OrderDto {
    private String order_num;
    private String buy_user;
    private String sell_user;
    private String item_num;
    private String size;
    private int wish_price;
    private Timestamp order_date;
}
