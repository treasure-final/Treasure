package boot.mvc.user;

import boot.mvc.user.kakaoApi.KakaoLoginBO;
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

import java.sql.Date;
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
    private KakaoLoginBO kakaoLoginBO;

    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    

    @GetMapping("/loginForm")
    public String loginForm(Model model, HttpSession session) {
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        System.out.println("네이버" + naverAuthUrl);
        model.addAttribute("urlNaver", naverAuthUrl);
        
        String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
        System.out.println("카카오:" + kakaoAuthUrl);
        model.addAttribute("urlKakao", kakaoAuthUrl);
        
        return "user/loginForm";
    }
    
	
	/*
	 * @RequestMapping(value = "/login.do",method =
	 * {RequestMethod.GET,RequestMethod.POST}) public String login(Model model,
	 * HttpSession session) { String kakaoAuthUrl =
	 * kakaoLoginBO.getAuthorizationUrl(session); System.out.println("카카오:" +
	 * kakaoAuthUrl); model.addAttribute("urlKakao", kakaoAuthUrl);
	 * 
	 * return "user/loginForm"; }
	 */
    
    @RequestMapping(value = "/naverLoginCallback", method = {RequestMethod.GET, RequestMethod.POST})
    public String callbackNaver(@RequestParam String code, @RequestParam String state,
                                HttpSession session) throws Exception {
        OAuth2AccessToken auth2AccessToken;
        auth2AccessToken = naverLoginBO.getAccessToken(session, code, state);
        apiResult = naverLoginBO.getUserProfile(auth2AccessToken);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;

        jsonObj = (JSONObject) jsonParser.parse(apiResult);
        JSONObject response_obj = (JSONObject) jsonObj.get("response");

        String email = (String) response_obj.get("email");
        String birthday = (String) response_obj.get("birthday");
        String nickname = (String) response_obj.get("nickname");
        String mobile = (String) response_obj.get("mobile");
        String name = (String) response_obj.get("name");
        String birthyear = (String) response_obj.get("birthyear");

        session.setAttribute("signIn", apiResult);
        session.setAttribute("loginEmail", email);
        session.setAttribute("loginOk", "loginOk");

        UserDto userDto = new UserDto();
        userDto.setUser_email(email);
        userDto.setUser_name(name);
        userDto.setUser_nickname(nickname);

        // 전화번호 String -> int 형변환
        String[] hps = mobile.split("-");
        String hp = "";
        for (int i = 0; i < hps.length; i++) {
            hp += hps[i];
        }
        userDto.setUser_hp(hp);

        // 생년월일 String -> Date 형변환
        Date birth = Date.valueOf(birthyear + "-" + birthday);
        userDto.setUser_birth(birth);
        if (service.userSearchEmail(email) != 1)
            service.insertJoinUser(userDto);

        return "redirect:/";
    }
    
    @RequestMapping(value = "/callbackKakao.do",method = {RequestMethod.GET,RequestMethod.POST})
    public String callbackKakao(Model model,@RequestParam String code, @RequestParam String state, HttpSession session) throws Exception{
    		
    	System.out.println("카카오 로그인 성공 callbackKakao");
    	OAuth2AccessToken oauthToken;
    	oauthToken=kakaoLoginBO.getAccessToken(session, code, state);
    	apiResult=kakaoLoginBO.getUserProfile(oauthToken);
    	
    	JSONParser jsonParser=new JSONParser();
    	JSONObject jsonObj;
    	
    	jsonObj = (JSONObject) jsonParser.parse(apiResult);
        JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");
        JSONObject response_obj2=(JSONObject) response_obj.get("profile");
        
        String email=(String) response_obj.get("email");
        String nickname=(String) response_obj2.get("nickname");
        
        session.setAttribute("signIn", apiResult);
        session.setAttribute("email", email);
        session.setAttribute("nickname", nickname);
        session.setAttribute("loginOk", "loginOk");
        
        UserDto userDto = new UserDto();
        userDto.setUser_email(email);
        userDto.setUser_nickname(nickname);
	
    	return "redirect:/";
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

    @PostMapping("/joinInsert")
    public String joinInsert(@ModelAttribute UserDto dto, String addr1, String addr2, String addr3, HttpSession session) {
    	String user_addr = addr1 + " " + addr2 + " " + addr3;
        dto.setUser_addr(user_addr);
        System.out.println(addr1 + " " + addr2 + " " + addr3);
        
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