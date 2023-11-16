package kr.co.ezen.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ezen.entity.Member;
import kr.co.ezen.service.BoardService;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/loginPro")
	public String login(Member vo, HttpSession session) {
		
		Member mem = boardService.login(vo);	//id, pw가 같으면 회원정보 다 불러와서
		if(mem!=null) {	//로그인이 되었으면
			session.setAttribute("mem", mem);
		}
		return "redirect:/board/list";	//강제이동
		
	}
	
	@RequestMapping("/logoutPro")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/board/list";
	}
	
}
