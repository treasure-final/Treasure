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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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

    @GetMapping("/user/loginForm")
    public String loginForm(Model model, HttpSession session) {
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        model.addAttribute("urlNaver", naverAuthUrl);

        String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
        System.out.println("카카오:" + kakaoAuthUrl);
        model.addAttribute("urlKakao", kakaoAuthUrl);

        return "/user/loginForm";
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
   
    
    @RequestMapping(value = "/callbackKakao.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String callbackKakao(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {

        System.out.println("카카오 로그인 성공 callbackKakao");
        OAuth2AccessToken oauthToken;
        oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
        apiResult = kakaoLoginBO.getUserProfile(oauthToken);

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj;

        jsonObj = (JSONObject) jsonParser.parse(apiResult);
        JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");
        JSONObject response_obj2 = (JSONObject) response_obj.get("profile");

        String email = (String) response_obj.get("email");
        String nickname = (String) response_obj2.get("nickname");

        session.setAttribute("signIn", apiResult);
        session.setAttribute("loginEmail", email);
        session.setAttribute("nickname", nickname);
        session.setAttribute("loginOk", "loginOk");
        
        UserDto userDto = new UserDto();
        userDto.setUser_email(email);
        userDto.setUser_name(nickname);
        
        
        if (service.userSearchEmail(email) != 1) {
        	
        	service.insertJoinUser(userDto);
        	 	
        	model.addAttribute("user_num", service.findEmailUserNum(email));

        	return "redirect:/user/kakaoUserForm?user_num="+model.getAttribute("user_num");
        }else {
        	
        	return "redirect:/";
        }
        
    }
    
    
   @GetMapping("/user/kakaoUserForm")
   public ModelAndView kakaoUserForm(String user_num) {
      
      ModelAndView mview=new ModelAndView();
      
      UserDto dto=service.getUserNumData(user_num);
      String email=dto.getUser_email();
      
      mview.addObject("dto", dto);
      mview.addObject("user_num", service.findEmailUserNum(email));
      mview.setViewName("/user/kakaoUserForm");
      
      return mview;
   }
    
    @PostMapping("/user/updateKaKaoUser")
    public String updateKakaoUser(@ModelAttribute UserDto dto, String addr1, String addr2, String addr3) {
    	
    	String user_addr = addr1 + " " + addr2 + " " + addr3;
        dto.setUser_addr(user_addr);
        
        System.out.println(dto.getUser_num());
    	service.kakaoUserInfoUpdate(dto);
    	
    	return "redirect:/";
    	
    }
    
    

    @PostMapping("/user/loginProc")
    public String loginProc(String email, String password,
                            HttpSession session, @RequestParam(required = false) String saveOk) {

        int check = service.checkIdAndPassword(email, password);
        if (check == 1) {
            session.setAttribute("loginEmail", email);
            session.setAttribute("loginOk", "loginOk");
            session.setAttribute("saveOk", saveOk);
            return "redirect:/";
        } else {
            return "redirect:/user/loginForm";
        }
    }

    @GetMapping("/user/loginError")
    @ResponseBody
    public int loginError(String email, String password) {
        int check = service.checkIdAndPassword(email, password);
        System.out.println(email + " " + password);
        System.out.println(check);
        return check;
    }

    @GetMapping("/user/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("loginOk");
        session.removeAttribute("signIn");
        return "redirect:/";
    }

    // 가입폼으로 이동
    @GetMapping("/user/joinForm")
    public String joinForm() {
        return "/user/joinForm";
    }

    // 이메일 중복 체크
    @GetMapping("/user/emailCheck")
    @ResponseBody
    public Map<String, Integer> emailCheck(String user_email) {
        Map<String, Integer> map = new HashMap<>();
        int n = service.userSearchEmail(user_email);
        map.put("count", n);
        return map;
    }

    @PostMapping("/user/joinInsert")
    public String joinInsert(@ModelAttribute UserDto dto, String addr1, String addr2, String addr3, HttpSession session) {
        String user_addr = addr1 + " " + addr2 + " " + addr3;
        dto.setUser_addr(user_addr);
        System.out.println(addr1 + " " + addr2 + " " + addr3);

        service.insertJoinUser(dto);
        return "redirect:/user/loginForm";
    }

    //닉네임 중복 체크
    @GetMapping("/user/nickNameCheck")
    @ResponseBody
    public Map<String, Integer> nickNameCheck(String user_nickname) {
        Map<String, Integer> map = new HashMap<>();
        int nick = service.userSearchNickname(user_nickname);
        map.put("nickcount", nick);
        return map;
    }

    @GetMapping("/user/emailSearchForm")
    public String emailSearchForm() {
        return "/user/emailSearchForm";
    }

    @GetMapping("/user/emailSearchProc")
    @ResponseBody
    public Map<String, Object> searchEmail(String name, String birth, String phone) {
        Map<String, String> map = new HashMap<>();
        map.put("user_name", name);
        map.put("user_birth", birth);
        map.put("user_hp", phone);
        int check = service.checkEmailByUserInfo(map);

        Map<String, Object> map2 = new HashMap<>();
        String email = service.findEmailByUserInfo(phone);
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
            map2.put("check", check);
            map2.put("email", security_email);
        } else {
            map2.put("check", check);
            map2.put("email", email);
        }
        return map2;
    }
    

    @GetMapping("/user/myPage")
    public String myinfo(Model model, HttpSession session) {
    	
    	String loginEmail=(String)session.getAttribute("loginEmail");
    	//System.out.println(loginEmail);
    	
    	String user_num=service.findEmailUserNum(loginEmail);
    	//System.out.println(user_num);
    		
    	UserDto dto=service.getUserNumData(user_num);
  
		model.addAttribute("dto", dto);
		model.addAttribute("user_num", user_num);
    	
    	return "/user/myPage";
    }
    
    @GetMapping("/user/myProfile")
    public String myProfile(Model model, HttpSession session) {
    	
    	String loginEmail=(String)session.getAttribute("loginEmail");
    	System.out.println(loginEmail);
    	
    	String user_num=service.findEmailUserNum(loginEmail);
    	System.out.println(user_num);
    		
    	UserDto dto=service.getUserNumData(user_num);
    	
    	 // 주소 분리
        String user_addr = dto.getUser_addr();
        String[] addressParts = user_addr.split(" ");
        String addr1 = addressParts[0];
        String addr2 = addressParts[1];
        String addr3 = addressParts[2];

        // 분리된 주소를 DTO에 저장
        dto.setAddr1(addr1);
        dto.setAddr2(addr2);
        dto.setAddr3(addr3);
  
		model.addAttribute("dto", dto);
		model.addAttribute("user_num", user_num);
    	
    	return "/user/myProfile";
    }
    
    @PostMapping("/user/updateProfile")
    public String updateProfile(UserDto dto, String addr1, String addr2, String addr3, HttpSession session, MultipartFile upload) {
    	
    	 String user_addr = addr1 + " " + addr2 + " " + addr3;
         dto.setUser_addr(user_addr);
    	
    	String path=session.getServletContext().getRealPath("/save");
    	
    	String fileName = UUID.randomUUID().toString() + "_" + upload.getOriginalFilename();
    	
    	if(upload.isEmpty()) {
    		dto.setUser_photo(null);
    	}else {
    		  		
    		dto.setUser_photo(fileName);
	    	
	    	try {
	    		upload.transferTo(new File(path+"\\"+fileName));
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	      	
    	}
    	service.userProfileUpdate(dto);
    	
    	return "redirect:/user/myPage";
    }



    
    
}