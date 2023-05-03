package boot.mvc.user;

import org.apache.ibatis.type.Alias;

import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.sql.Date;
import java.sql.Timestamp;

@Data
@Alias("UserDto")
public class UserDto {
    private String user_num;
    private String user_email;
    private String user_pass;
    private String user_name;
    private String user_nickname;
    private String user_photo;
    private int user_hp;
    private Date user_birth;
    private String user_addr;
    private Timestamp user_joinday;
}
