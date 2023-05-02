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
}
