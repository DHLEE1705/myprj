package com.kh.portfolio.board2.controller;
/*
 * 용병 모집과 관련된 컨트롤러
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.kh.portfolio.common.Code;
import com.kh.portfolio.member.vo.MemberVO;

@Controller
@RequestMapping("/board3")
public class BoardController2 {
	private static final Logger logger = LoggerFactory.getLogger(BoardController2.class);

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
		
		//매치방식
		List<Code> matchmethod = new ArrayList<>();
		matchmethod.add(new Code("4vs4","4vs4"));
		matchmethod.add(new Code("5vs5","5vs5"));
		matchmethod.add(new Code("6vs6","6vs6"));
		matchmethod.add(new Code("7vs7","7vs7"));
		model.addAttribute("matchmethod", matchmethod);
		
		//실력
				List<Code> skill = new ArrayList<>();
				skill.add(new Code("최상","최상"));
				skill.add(new Code("상","상"));
				skill.add(new Code("중","중"));
				skill.add(new Code("하","하"));
				model.addAttribute("skill", skill);
				
	   //원하는 용병수
				List<Code> wantc = new ArrayList<>();
				wantc.add(new Code("1명","1명"));
				wantc.add(new Code("2명","2명"));
				wantc.add(new Code("3명","3명"));
				wantc.add(new Code("4명","4명"));
        model.addAttribute("wantc", wantc);
		//매치 상태
				List<Code> matchstatus = new ArrayList<>();
				matchstatus.add(new Code("대기중","대기중"));
				matchstatus.add(new Code("완료","완료"));	
				model.addAttribute("matchstatus",matchstatus);	   								
	}
	
	@ModelAttribute // 다른 메소드에서 공유가능
	public void getBoardCategory(Model model) {
		List<BoardCategoryVO> boardCategoryVO = boardSVC2.getCategory();
		model.addAttribute("boardCategoryVO", boardCategoryVO);		
	}
	//용병모집 작성 양식
		@GetMapping("/list4")
		public String list4(
				Model model, HttpServletRequest request) {			
			  model.addAttribute("boardVO2", new BoardVO2());	
			
			return "/board/list4";
		}
		//용병모집 작성
		@PostMapping("/write2")
		public String write(
				@Valid @ModelAttribute("boardVO2") BoardVO2 boardVO2,
				BindingResult result,
				HttpServletRequest request){
			
			logger.info("게시글작성: " + boardVO2.toString());		
			if(result.hasErrors()) {
				logger.info("오류발생");
				return "/board/list4";
			}	
			
			MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
			boardVO2.setBid(memberVO.getId());
			boardVO2.setBname(memberVO.getName());
			boardVO2.setBtel(memberVO.getTel());
			
			boardSVC2.write(boardVO2);
			
			return "redirect:/board3/list6/";
		}
		
		//게시글 보기
		@GetMapping("/view2/{bnum}")
		public String view(
				@PathVariable String bnum,
				Model model) {
			
			Map<String,Object> map = boardSVC2.view(bnum);
			BoardVO2 boardVO2 = (BoardVO2)map.get("board2");
			logger.info(boardVO2.toString());			
			model.addAttribute("boardVO2", boardVO2);
			
			return "/board/readForm2";
		}	
		
		//게시글 삭제
		@GetMapping("/delete2/{bnum}")
		public String delete(
				@PathVariable String bnum, 
				Model model) {		
			//1)게시글 및 첨부파일 삭제
			boardSVC2.delete(bnum);
			model.addAttribute("list", boardSVC2.list());
			
			return "redirect:/board3/list6/";
		}
	
		//게시글 수정
		@PostMapping("/modify")
		public String modify(
				@Valid @ModelAttribute("boardVO2") BoardVO2 boardVO2,
				BindingResult result,HttpServletResponse response	
				) throws IOException {
			if(result.hasErrors()) {
				logger.info("오류발생");
				
				return "/board/readForm2";
			}
			
			logger.info("게시글 수정 내용:" + boardVO2.toString());
			boardSVC2.modify(boardVO2);
		return "redirect:/board3/list6/";
		}
		
		@GetMapping("/list7")
		public String groundview() {
			return "/board/list7";
		}
}
