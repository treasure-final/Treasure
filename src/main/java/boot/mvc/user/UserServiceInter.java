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
   
   //카카오 정보 추가 입력
   public void kakaoUserInfoUpdate(UserDto dto);
   
 //getData
   public UserDto getUserNumData(String user_num);
   
 //이메일로 num 찾기
   public String findEmailUserNum(String user_email);
   
 //프로필 수정
   public void userProfileUpdate(UserDto dto);

    //임시 비밀번호 발급 전 이메일 존재 여부 확인
    public int isUserEmail(String user_email);

    //임시 비밀번호로 비밀번호 변경
    public void updateTemporarilyPass(String user_pass,String user_email);
}