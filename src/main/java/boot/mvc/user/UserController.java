package boot.mvc.user;

import boot.mvc.user.naverApi.NaverLoginBO;
import com.github.scribejava.core.model.OAuth2AccessToken;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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

    private NaverLoginBO naverLoginBO;
    private String apiResult = null;

    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    @GetMapping("/loginForm")
    public String loginForm(Model model, HttpSession session) {
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        System.out.println("네이버" + naverAuthUrl);
        model.addAttribute("urlNaver", naverAuthUrl);

        return "user/loginForm";
    }

    @RequestMapping(value = "/callbackNaver", method = {RequestMethod.GET, RequestMethod.POST})
    public String callbackNaver(Model model, @RequestParam String code, @RequestParam String state,
                                HttpSession session) throws Exception {
        System.out.println("로그인 성공 callbackNaver");
        OAuth2AccessToken auth2AccessToken;
        auth2AccessToken = naverLoginBO.getAccessToken(session, code, state);
        apiResult = naverLoginBO.getUserProfile(auth2AccessToken);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;

        jsonObj = (JSONObject) jsonParser.parse(apiResult);
        JSONObject response_obj = (JSONObject) jsonObj.get("response");

        String email = (String) response_obj.get("email");
        String name = (String) response_obj.get("name");

        session.setAttribute("signIn", apiResult);
        session.setAttribute("email", email);
        session.setAttribute("name", name);

        return "redirect:loginSuccess";
    }

    @GetMapping("/loginSuccess")
    public String loginSuccess() {
        return "user/loginSuccess";
    }

    @PostMapping("/loginProc")
    public String loginProc(String email, String password,
                            HttpSession session, @RequestParam(required = false) String saveOk) {

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

    @PostMapping("joinInsert")
    public String joinInsert(@ModelAttribute UserDto dto, HttpSession session) {
        service.insertJoinUser(dto);
        return "redirect:/loginForm";
    }

    //닉네임 중복 체크
    @GetMapping("/nickNameCheck")
    @ResponseBody
    public Map<String, Integer> nickNameCheck(String user_nickname) {

        Map<String, Integer> map = new HashMap<>();

        int nick = service.userSearchNickname(user_nickname);

        map.put("nickcount", nick);

        return map;
    }
}