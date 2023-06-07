package boot.mvc.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserService implements UserServiceInter {

    @Autowired
    UserMapperInter mapper;

    @Override
    public int checkIdAndPassword(String email, String password) {
        Map<String, String> map = new HashMap<>();
        map.put("user_email", email);
        map.put("user_pass", password);
        int check = mapper.checkIdAndPassword(map);
        return check;
    }

    //가입
    @Override
    public void insertJoinUser(UserDto dto) {
        mapper.insertJoinUser(dto);
    }

    //이메일 중복 체크
    @Override
    public int userSearchEmail(String user_email) {
        return mapper.userSearchEmail(user_email);
    }

    //닉네임 중복 체크
    @Override
    public int userSearchNickname(String user_nickname) {
        return mapper.userSearchNickname(user_nickname);
    }

    @Override
    public int checkEmailByUserInfo(Map<String, String> map) {
        return mapper.checkEmailByUserInfo(map);
    }

    @Override
    public String findEmailByUserInfo(String hp) {
        return mapper.findEmailByUserInfo(hp);
    }

    @Override
    public void kakaoUserInfoUpdate(UserDto dto) {
        // TODO Auto-generated method stub
        mapper.kakaoUserInfoUpdate(dto);

    }

    @Override
    public UserDto getUserNumData(String user_num) {
        // TODO Auto-generated method stub
        return mapper.getUserNumData(user_num);
    }

    @Override
    public String findEmailUserNum(String user_email) {
        // TODO Auto-generated method stub
        return mapper.findEmailUserNum(user_email);
    }

    @Override
    public void userProfileUpdate(UserDto dto) {
        // TODO Auto-generated method stub
        mapper.userProfileUpdate(dto);

    }

    @Override
    public int isUserEmail(String user_email) {
        return mapper.isUserEmail(user_email);
    }

    @Override
    public void updateTemporarilyPass(String user_pass, String user_email) {
        Map<String, String> map = new HashMap<>();
        map.put("user_pass", user_pass);
        map.put("user_email", user_email);
        mapper.updateTemporarilyPass(map);
    }


    //스타일리스트에서 씀
    @Override
    public String getName(String user_email) {
        // TODO Auto-generated method stub
        return mapper.getName(user_email);
    }

    @Override
    public String getUserPhoto(String user_email) {
        // TODO Auto-generated method stub
        return mapper.getUserPhoto(user_email);
    }

    @Override
    public UserDto findByUserEmail(String Email) {
        return mapper.findByUserEmail(Email);
    }

    @Override
    public Map<String, Object> resultByCheck(int check, String email) {
        Map<String, Object> checkResultMap = new HashMap<>();
        if (check == 1) {
            String[] emails = email.split("@");
            String[] first_email = emails[0].split("");
            String security_email = "";
            security_email += first_email[0] + first_email[1] + first_email[2];
            for (int i = 3; i < first_email.length - 1; i++) {
                security_email += first_email[i].replace(first_email[i], "*");
            }
            security_email += first_email[first_email.length - 1];
            security_email += "@" + emails[1];
            checkResultMap.put("check", check);
            checkResultMap.put("email", security_email);
        } else {
            checkResultMap.put("check", check);
            checkResultMap.put("email", email);
        }
        return checkResultMap;
    }

    @Override
    public UserDto splitAddrUserDto(UserDto dto) {
        String user_addr = dto.getUser_addr();

        String[] addressParts = user_addr.split(" ");
        String addr1 = addressParts[0];
        String addr2 = addressParts[1];
        String addr3 = addressParts[2];

        dto.setAddr1(addr1);
        dto.setAddr2(addr2);
        dto.setAddr3(addr3);

        return dto;
    }
}