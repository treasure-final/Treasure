package boot.mvc.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	UserService service;

	@GetMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}

	@PostMapping("/loginInsert")
	public String loginInsert(String email, String password, HttpSession session,
			@RequestParam(required = false) String saveOk) {
		int check = service.checkIdAndPassword(email, password);
		if (check == 1) {
			session.setAttribute("loginEmail", email);
			session.setAttribute("loginOk", "loginOk");
			session.setAttribute("saveOk", saveOk);
			return "redirect:/";
		} else {
			return "redirect:loginForm";
		}
	}

	@GetMapping("/loginError")
	@ResponseBody
	public int loginError(String email, String password) {
		int check = service.checkIdAndPassword(email, password);
		System.out.println(email + " " + password);
		System.out.println(check);
		return check;
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginOk");
		return "redirect:/";
	}

	// 가입폼으로 이동
	@GetMapping("/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}

	// 이메일 중복 체크
	@GetMapping("/emailCheck")
	@ResponseBody
	public Map<String, Integer> emailCheck(String user_email) {

		Map<String, Integer> map = new HashMap<>();

		int n = service.userSearchEmail(user_email);

		map.put("count", n);

		return map;
	}
	
	//닉네임 중복 체크
	@GetMapping("/nickNameCheck")
	@ResponseBody
	public Map<String, Integer> nickNameCheck(String user_nickname){
		
		Map<String, Integer> map = new HashMap<>();
		
		int nick = service.userSearchNickname(user_nickname);

		map.put("nickcount", nick);

		return map;
	}

	@PostMapping("joinInsert")
	public String joinInsert(@ModelAttribute UserDto dto, HttpSession session) {
		service.insertJoinUser(dto);
		return "redirect:/loginForm";
	}
}
