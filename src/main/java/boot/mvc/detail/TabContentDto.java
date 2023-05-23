package boot.mvc.detail;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("TabContentDto")
public class TabContentDto {

	private String size;  
	private String price;
	private String date;
	private String count;
	
}
