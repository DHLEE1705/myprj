package com.kh.portfolio.board3.controller;
/*
 * 용병 신청 컨트롤러
 */

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board2.svc.BoardSVC2;
import com.kh.portfolio.board2.vo.BoardVO2;
import com.kh.portfolio.board3.svc.BoardSVC3;
import com.kh.portfolio.board3.vo.BoardVO3;
import com.kh.portfolio.common.Code;
import com.kh.portfolio.member.svc.MemberSVC;
import com.kh.portfolio.member.vo.MemberVO;

@Controller
@RequestMapping("/board3")
public class BoardController3 {
	private static final Logger logger = LoggerFactory.getLogger(BoardController3.class);

	@Inject
	BoardSVC3 boardSVC3;
	
	@Inject
	MemberSVC memberSVC;
	
	@Inject
	BoardSVC2 boardSVC2;
	@ModelAttribute //커맨드 객체 이름바꾸는 어노테이션, 여러뷰에서 공통으로 참조가능
	public void initData(Model model) {
		//지역
		List<Code> region = new ArrayList<>();
		region.add(new Code("울산(남구)", "울산(남구)"));
		region.add(new Code("울산(동구)", "울산(동구)"));
		region.add(new Code("울산(북구)", "울산(북구)"));
		region.add(new Code("울산(중구)", "울산(중구)"));
		region.add(new Code("부산(남구)", "부산(남구)"));
		region.add(new Code("부산(동래구)", "부산(동래구)"));
		region.add(new Code("부산(수영구)", "부산(수영구)"));
		region.add(new Code("부산(해운대구)", "부산(해운대구)"));
		model.addAttribute("region", region);
		
		
		//실력
				List<Code> skill = new ArrayList<>();
				skill.add(new Code("최상","최상"));
				skill.add(new Code("상","상"));
				skill.add(new Code("중","중"));
				skill.add(new Code("하","하"));
				model.addAttribute("skill", skill);
	   //매너
				List<Code> manner = new ArrayList<>();
				manner.add(new Code("최상","최상"));
				manner.add(new Code("상","상"));
				manner.add(new Code("중","중"));
				manner.add(new Code("하","하"));
				model.addAttribute("manner", manner);
	}
	
	@ModelAttribute // 다른 메소드에서 공유가능
	public void getBoardCategory(Model model) {
		List<BoardCategoryVO> boardCategoryVO = boardSVC3.getCategory();
		model.addAttribute("boardCategoryVO", boardCategoryVO);
	}
	
	//용병신청 작성 양식
	@GetMapping("/list5")
	public String list5(
			Model model, HttpServletRequest request) {
		
		model.addAttribute("boardVO3", new BoardVO3());	
		
		return "/board/list5";
	}
	
	//용병신청 작성 처리
	@PostMapping("/write")
	public String write(
			@Valid @ModelAttribute("boardVO3") BoardVO3 boardVO3,
			BindingResult result,
			HttpServletRequest request,
			HttpServletResponse response
			) throws IOException {
		
		logger.info("게시글작성: " + boardVO3.toString());		
		if(result.hasErrors()) {
			logger.info("오류발생");
			return "/board/list5";
		}	
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
		boardVO3.setBid(memberVO.getId());
		boardVO3.setBname(memberVO.getName());
		boardVO3.setBtel(memberVO.getTel());
		boardVO3.setFdata(memberVO.getFdata());
		boardVO3.setFsize(memberVO.getFsize());
		boardVO3.setFname(memberVO.getFname());
		
		boardSVC3.write(boardVO3);
		
		return "redirect:/board3/list6/";
	}
	
	//용병현황 보기
		@GetMapping("/view/{bnum}")
		public String view(  
				@PathVariable String bnum,
				Model model) {
			
			Map<String,Object> map = boardSVC3.view(bnum);
			BoardVO3 boardVO3 = (BoardVO3)map.get("board3");
			logger.info(boardVO3.toString());		
			
			model.addAttribute("boardVO3", boardVO3);
		
			return "/board/readForm4";
		}
		
	//용병목록 삭제
		@GetMapping("/delete/{bnum}")
		public String delete(
				@PathVariable String bnum, 
				Model model) {
			//1)게시글 및 첨부파일 삭제
			boardSVC3.delete(bnum);
			//2)
			model.addAttribute("list", boardSVC3.list());
			return "redirect:/board3/list6/";
		}
		
		
	//용병 현황 목록
		@GetMapping({"/list6","/list6/{searchType}/{keyword}",
					 			 "/list7/{searchType2}/{keyword2}"})
		public String listAll(
				 @PathVariable(required=false) String searchType,
				 @PathVariable(required=false) String keyword,
				 @PathVariable(required=false) String searchType2,
				 @PathVariable(required=false) String keyword2,
			    @Valid @ModelAttribute("boardVO3") BoardVO3 boardVO3,
				BindingResult result,
				HttpServletRequest request,
				Model model) {

			//게시글 목록
			BoardVO2 boardVO2 = new BoardVO2();
			model.addAttribute("boardVO2", boardVO2);
			model.addAttribute("list2", boardSVC2.list2(searchType2,keyword2));
			model.addAttribute("boardVO3", boardVO3);
			model.addAttribute("list", boardSVC3.list(searchType,keyword));
			
			return "board/list6";		
		}
		
 
		@GetMapping("/file/{id:.+}")
		public ResponseEntity<byte[]> getFile(@PathVariable String id){
			MemberVO memberVO = memberSVC.selectMember(id);
			logger.info("getFile " + memberVO.toString());
			
			final HttpHeaders headers = new HttpHeaders();
			String filename = null;
			try {
				filename = new String(memberVO.getFname().getBytes("euc-kr"), "ISO-8859-1");			
			}
			catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			headers.setContentDispositionFormData("attachment", filename);
			return new ResponseEntity<byte[]>(memberVO.getFdata(), headers, HttpStatus.OK);
		}
		
		
		

}
