package boot.mvc.item;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("ItemDto")
public class ItemDto {
	private String item_num;
	private String item_brandname;
	private String item_category;
	private String item_engname;
	private String item_korname;
	private String item_modelnum;
    private String item_releaseday;
    private String item_color;
    private String item_size;
    private String item_releaseprice;
    private String item_image;
    private Timestamp item_inputday;
}
