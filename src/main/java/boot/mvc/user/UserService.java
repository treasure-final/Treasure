package boot.mvc.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public void updateTemporarilyPass(String user_pass,String user_email) {
        Map<String,String> map=new HashMap<>();
        map.put("user_pass",user_pass);
        map.put("user_email",user_email);
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

	


}