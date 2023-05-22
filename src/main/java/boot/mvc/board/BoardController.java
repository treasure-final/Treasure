package boot.mvc.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.mvc.item.ItemService;
import boot.mvc.user.UserDto;
import boot.mvc.user.UserService;

@Controller
public class BoardController {

	@Autowired
	BoardService service;

	@Autowired
	UserService uservice;

	@Autowired
	ItemService iservice;

	@GetMapping("/style/stylelist")
	public ModelAndView list( Model model, HttpSession session)
	{
		ModelAndView bview = new  ModelAndView();

		List<BoardDto> list = service.getList();

		bview.addObject("list", list);
		bview.setViewName("/style/stylelist");


		String loginEmail=(String)session.getAttribute("loginEmail");
		//System.out.println(loginEmail);

		String user_num=uservice.findEmailUserNum(loginEmail);
		//System.out.println(user_num);

		UserDto dto=uservice.getUserNumData(user_num);

		model.addAttribute("dto", dto); model.addAttribute("user_num", user_num);




		return bview;
	}


	@GetMapping("/style/writestyleform")
	public String mystyle(Model model, HttpSession session) {

		String loginEmail=(String)session.getAttribute("loginEmail");
		//System.out.println(loginEmail);

		String user_num=uservice.findEmailUserNum(loginEmail);
		//System.out.println(user_num);

		UserDto dto=uservice.getUserNumData(user_num);

		model.addAttribute("dto", dto);
		model.addAttribute("user_num", user_num);

		return "/style/writestyleform";
	}




	@PostMapping("/style/insert")
	public String insert(@ModelAttribute BoardDto bdto,
						 MultipartFile upload, HttpSession session,Model model)
	{


		String path=session.getServletContext().getRealPath("/img");



		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName="photo_"+sdf.format(new Date())+"_"+upload.getOriginalFilename();

		bdto.setBoard_image(fileName);





		try {
			upload.transferTo(new File(path+"\\"+fileName));
			System.out.println("스타일 올리기 성공");



		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			System.out.println("스타일 올리기 실패");

			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		String myid = (String)session.getAttribute("loginEmail");
		bdto.setMyid(myid);
		System.out.println(myid);

		//이름은 memberservice에서 얻어서 dto에 저장
		String name = uservice.getName(myid);
		bdto.setName(name); System.out.println(name);



		String photo =uservice.getUserPhoto(myid);
		bdto.setMyphoto(photo);
		System.out.println(photo);

		service.insertStyle(bdto);

		return "redirect:/style/stylelist";
	}



}