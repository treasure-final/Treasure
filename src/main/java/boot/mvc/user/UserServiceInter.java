package boot.mvc.user;

import java.util.Map;

public interface UserServiceInter {
    public int checkIdAndPassword(String email, String pass);
    
    //가입
     public void insertJoinUser(UserDto dto);
     
     //이메일 중복 체크
     public int userSearchEmail(String user_email);
     
     //닉네임 중복 체크
     public int userSearchNickname(String user_nickname);

   public int checkEmailByUserInfo(Map<String, String> map);

   public String findEmailByUserInfo(String hp);

}