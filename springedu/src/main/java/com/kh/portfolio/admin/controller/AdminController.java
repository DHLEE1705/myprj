package com.kh.portfolio.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.portfolio.member.controller.LoginController;
import com.kh.portfolio.member.svc.MemberSVC;
import com.kh.portfolio.member.vo.MemberVO;

@Controller //Presentation Layer에서 Contoller를 명시하기 위해서 사용


@RequestMapping("/admin")

public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Inject
	MemberSVC memberSVC;

	//관리자페이지
	@GetMapping("/admin")
	public String adminPage() {
		
		return "admin/index";
	}
	
	//회원목록
	@GetMapping("/memberList")//회원목록 볼라면 memberList로 mapping ex) action = "/memberList"
	
	public String memberList(Model model) {
		
		List<MemberVO> list = memberSVC.selectAllMember();
		model.addAttribute("memberList", list); //jsp페이지에서 items로 불러오기위해 
		return "/admin/memberList";
}
	
//	@GetMapping("/memberList")
//	public String memberList(
//			@Valid @ModelAttribute("memberList") List<MemberVO> list,
//			BindingResult result,
//			HttpSession session,
//			Model model
//			) {
//		return "/admin/memberList";
//}

}
