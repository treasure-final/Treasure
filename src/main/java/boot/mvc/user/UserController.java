package boot.mvc.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String loginInsert(String email, String password,
							  HttpSession session, @RequestParam(required = false) String saveOk) {
		int check = service.checkIdAndPassword(email, password);
		if(check==1) {
			session.setAttribute("loginEmail", email);
			session.setAttribute("loginOk", "loginOk");
			session.setAttribute("saveOk", saveOk);
			return "redirect:/";
		} else {
			return "redirect:loginForm";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginOk");
		return "redirect:/";
	}
}
