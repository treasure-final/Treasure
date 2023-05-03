package boot.mvc.user;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface UserMapperInter {
    public int checkIdAndPassword(Map<String, String> map);
    
    //가입
  	public void insertJoinUser(UserDto dto);
  	
  	//이메일 중복 체크
  	public int userSearchEmail(String user_email);
  	
  	//닉네임 중복 체크
  	public int userSearchNickname(String user_nickname);

}
