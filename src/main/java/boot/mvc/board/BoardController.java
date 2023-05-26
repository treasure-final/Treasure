package boot.mvc.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import boot.mvc.board_like.BoardLikeDto;
import boot.mvc.board_like.BoardLikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@Autowired
	BoardLikeService boardLikeService;

	@GetMapping("/style/stylelist")
	public ModelAndView list(Model model, HttpSession session) {
		ModelAndView bview = new ModelAndView();

		List<BoardDto> list = service.getList();

		for(BoardDto bdto:list) {
			String [] photos=bdto.getBoard_image().split(",");
			bdto.setDimage(photos[0]);

		}


		String loginEmail = (String) session.getAttribute("loginEmail");
		// System.out.println(loginEmail);

		String user_num = uservice.findEmailUserNum(loginEmail);
		// System.out.println(user_num);

		for(int i=0; i<list.size(); i++) {
			list.get(i).setBoardLikeCheck(boardLikeService.boardLikeCheck(list.get(i).getBoard_id(),user_num));
		}

		UserDto dto = uservice.getUserNumData(user_num);

		bview.addObject("list", list);
		bview.setViewName("/style/stylelist");

		model.addAttribute("dto", dto);
		model.addAttribute("user_num", user_num);

		return bview;
	}

	@GetMapping("/style/writestyleform")
	public String writeMytyle(Model model, HttpSession session) {

		String loginEmail = (String) session.getAttribute("loginEmail");
		// System.out.println(loginEmail);

		String user_num = uservice.findEmailUserNum(loginEmail);
		// System.out.println(user_num);

		UserDto dto = uservice.getUserNumData(user_num);

		model.addAttribute("dto", dto);
		model.addAttribute("user_num", user_num);

		return "/style/writestyleform";
	}


	@PostMapping("/style/insert")
	public String insert(@ModelAttribute BoardDto bdto,
						 @RequestParam ArrayList<MultipartFile> upload, HttpSession session) {

		String path=session.getServletContext().getRealPath("/img/style_image");
		System.out.println(path);

		String uploadName="";
		int idx=1;

		if (upload.get(0).getOriginalFilename().equals(""))
			uploadName="no";
		else {
			for(MultipartFile f:upload) {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss"); //겹치지않게 해주는거
				String fName=idx++ +"_"+sdf.format(new Date())+"_"+f.getOriginalFilename(); //인덱스 번호 붙이기
				uploadName+=fName+",";

				///업로드
				try {
					f.transferTo(new File(path+"\\"+ fName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			uploadName=uploadName.substring(0,uploadName.length()-1);
		}
		bdto.setBoard_image(uploadName);


		String myid = (String)session.getAttribute("loginEmail");
		bdto.setMyid(myid);
		System.out.println(myid);

		//이름은 memberservice에서 얻어서 dto에 저장
		String name = uservice.getName(myid);
		bdto.setName(name);
		System.out.println(name);


		String photo =uservice.getUserPhoto(myid);
		bdto.setMyphoto(photo);
		System.out.println(photo);


		service.insertStyle(bdto);

		return "redirect:/style/stylelist";
	}


	@GetMapping("/style/mystyle")

	public ModelAndView myStyle(Model model, HttpSession session) {
		ModelAndView bview = new ModelAndView();


		List<BoardDto> list = service.getList();

		for(BoardDto bdto:list) {
			String [] photos =bdto.getBoard_image().split(",");
			bdto.setDimage(photos[0]);

		}


		String loginEmail = (String) session.getAttribute("loginEmail");
		// System.out.println(loginEmail);

		String user_num = uservice.findEmailUserNum(loginEmail);
		// System.out.println(user_num);

		UserDto dto = uservice.getUserNumData(user_num);

		bview.addObject("list", list);
		bview.setViewName("/style/mystyle");

		bview.addObject("dto", dto);
		bview.addObject("user_num", user_num);

		return bview;
	}

	@GetMapping("/style/delete")
	@ResponseBody
	public void deleteStyle(@RequestParam String board_id) {
		service.deleteStyle(board_id);
	}



}