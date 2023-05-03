package boot.mvc.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.Map;

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
        // TODO Auto-generated method stub
        mapper.insertJoinUser(dto);

    }

    //이메일 중복 체크
    @Override
    public int userSearchEmail(String user_email) {
        // TODO Auto-generated method stub
        return mapper.userSearchEmail(user_email);
    }

    //닉네임 중복 체크
    @Override
    public int userSearchNickname(String user_nickname) {
        // TODO Auto-generated method stub
        return mapper.userSearchNickname(user_nickname);
    }
}