package com.kh.portfolio;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.portfolio.board.svc.BoardSVC;
import com.kh.portfolio.board3.svc.BoardSVC3;
import com.kh.portfolio.board4.svc.BoardSVC4;
import com.kh.portfolio.member.vo.MemberVO;


@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	BoardSVC boardSVC;
	
	@Inject
	BoardSVC3 boardSVC3;
	
	@Inject
	BoardSVC4 boardSVC4;
	
	@GetMapping({ "/", "/list"})
	public String home(
			HttpSession session, Locale locale, 
			@RequestParam(value = "reqURI", required=false) String reqURI,
			Model model) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		 
		model.addAttribute("NOTICE", boardSVC.list("NOTICE"));
		model.addAttribute("RESULT", boardSVC.list("RESULT"));
		model.addAttribute("BLACK", boardSVC.list("BLACKLIST"));
		model.addAttribute("list2", boardSVC3.list());
		model.addAttribute("list3", boardSVC4.list());
				
		logger.info("메인컨트롤러reqURI:" + reqURI); logger.info("maincontroller");
	 
	 if(reqURI == null) { 
		 reqURI ="/"; } 
	 
	 model.addAttribute("reqURI", reqURI);
		return "index";
	}
	
	@GetMapping("/rboard/rereplyForm")
	public String rereplyForm() {
		return "/board/rereply";
	}
	
	/*
	 * @GetMapping("/sse/stock") public String stock() { return "/sse/stock"; }
	 * 
	 * @GetMapping("/sse/stockServer") public String stockServer() { return
	 * "/sse/stockServer"; }
	 */
	
}
