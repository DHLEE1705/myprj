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

/**
 * Handles requests for the application home page.
 */

@Controller


public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Inject
	BoardSVC boardSVC;
	
	@Inject
	BoardSVC3 boardSVC3;
	
	@Inject
	BoardSVC4 boardSVC4;

	//@RequestMapping("/")
	@GetMapping({ "/", "/list", "/list/{reqPage}", "/list/{reqPage}/{searchType}/{keyword}" })
	public String home(@PathVariable(required = false) String reqPage, @PathVariable(required = false) String searchType,
			@PathVariable(required = false) String keyword, HttpSession session, Locale locale, 
			@RequestParam(value = "reqURI", required=false) String reqURI,
			Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);	
//		model.addAttribute("serverTime", formattedDate );
//		return "home"; // == > /WEB-INF/views/home.jsp
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		 
		// 게시글 목록
		model.addAttribute("list", boardSVC.list(reqPage, searchType, keyword));
		// 페이지 제어
		model.addAttribute("pc", boardSVC.getPageCriteria(reqPage, searchType, keyword));
		
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
	
}
