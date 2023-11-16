package kr.co.ezen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.ezen.entity.Board;
import kr.co.ezen.entity.Criteria;
import kr.co.ezen.entity.PageCre;
import kr.co.ezen.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/list")
	public String getList(Model m, Criteria cri) {
		
		List<Board> li=boardService.getList(cri);
		m.addAttribute("li",li);
		
		PageCre pageCre=new PageCre();
		pageCre.setCri(cri);
		pageCre.setTotalCount(boardService.totalCount(cri));
		
		m.addAttribute("pageCre",pageCre); //페이징 처리하기 위해 list.jsp로 넘겨야한다
		
		return "board/list";
	}
	
	
	
	@GetMapping("/register")
	public String register() {
		return "board/register";
	}
	
	@PostMapping("/register")
	public String register(Board vo, RedirectAttributes rttr) {
		boardService.register(vo);
		rttr.addFlashAttribute("result", vo.getIdx());
		return "redirect:/board/list";
	}
	
	@GetMapping("/get")
	public String get(@RequestParam("idx") int idx, Model mo, @ModelAttribute("cri") Criteria cri) {
		
		boardService.cntUpdate(idx);
		Board vo=boardService.get(idx);
		mo.addAttribute("vo",vo);	//글번호 기준으로 제목, 내용...
		return "board/get";
	}
	
	
	
	@GetMapping("/modify")
	public String modify(@RequestParam("idx") int idx, Model mo,
			@ModelAttribute("cri") Criteria cri) {
		
		Board vo=boardService.get(idx);
		mo.addAttribute("vo",vo);
		return "board/modify";
	}
	
	@PostMapping("/modify")
	public String modify(Board vo, Criteria cri, RedirectAttributes rttr) {
		
		boardService.modify(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";
	}
	
	@GetMapping("/remove")
	public String remove(int idx, Criteria cri, RedirectAttributes rttr) {
		boardService.remove(idx);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		
		return "redirect:/board/list";
		
	}
	
	@GetMapping("/reply")
	public String reply(int idx, Model mo, @ModelAttribute("cri") Criteria cri) {
		
		Board vo=boardService.get(idx);
		mo.addAttribute("vo",vo);
		return "board/reply";
	}
	
	@PostMapping("/reply")
	public String reply(Board vo, Criteria cri, RedirectAttributes rttr ) {
		boardService.replyPro(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
}
