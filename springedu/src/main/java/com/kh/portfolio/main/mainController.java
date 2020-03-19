package com.kh.portfolio.main;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.portfolio.board.svc.BoardSVC;
import com.kh.portfolio.member.vo.MemberVO;


@Controller
public class mainController {
	
	@Inject
	BoardSVC boardSVC;
	
	
	public String listAll(HttpSession session, Model model) {
			MemberVO memberVO = (MemberVO)session.getAttribute("member");		
			model.addAttribute("list", boardSVC.list());
			return "index";
		
	}
}
