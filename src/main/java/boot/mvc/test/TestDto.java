package boot.mvc.test;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("TestDto")
public class TestDto {

	private String test_num;
	private String sell_num;
	private String user_num;
	private String test_status;
	private String test_success;
	private String test_passday;
	
}
