package boot.mvc.buy_now;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Data
@Alias("BuyNowDto")
public class BuyNowDto {
    private String buynow_num;
    private String user_num;
    private String item_num;
    private String sell_num;
    private int buynow_price;
    private int buy_status;
    private String delivery;
    private String buy_addr;
    private String payment;
    private Timestamp buynow_inputday;
}
