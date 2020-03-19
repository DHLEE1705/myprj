package com.kh.portfolio.board4.controller;

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
import com.kh.portfolio.board4.svc.BoardSVC4;
import com.kh.portfolio.board4.vo.BoardVO4;
import com.kh.portfolio.common.Code;
import com.kh.portfolio.member.vo.MemberVO;

@Controller
@RequestMapping("/board4")
public class BoardController4 {
	private static final Logger logger = LoggerFactory.getLogger(BoardController4.class);

	@Inject
	BoardSVC4 boardSVC4;
	
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
				
	   //매너
				List<Code> manner = new ArrayList<>();
				manner.add(new Code("최상","최상"));
				manner.add(new Code("상","상"));
				manner.add(new Code("중","중"));
				manner.add(new Code("하","하"));
				model.addAttribute("manner", manner);
		//매치 상태
				List<Code> matchstatus = new ArrayList<>();
				matchstatus.add(new Code("대기중","대기중"));
				matchstatus.add(new Code("완료","완료"));
				
				model.addAttribute("matchstatus",matchstatus);
	   
							
		
	}
	
	@ModelAttribute // 다른 메소드에서 공유가능
	public void getBoardCategory(Model model) {
		List<BoardCategoryVO> boardCategoryVO = boardSVC4.getCategory();
		model.addAttribute("boardCategoryVO", boardCategoryVO);
		
	}
	//매치등록 작성 양식
		@GetMapping("/list2")
		public String list4(
				Model model, HttpServletRequest request) {
			
			model.addAttribute("boardVO4", new BoardVO4());	
			
			return "/board/list2";
		}
		//용병모집 작성
		@PostMapping("/write")
		public String write(
				@Valid @ModelAttribute("boardVO4") BoardVO4 boardVO4,
				BindingResult result,
				HttpServletRequest request){
			
			logger.info("게시글작성: " + boardVO4.toString());		
			if(result.hasErrors()) {
				logger.info("오류발생");
				return "/board/list2";
			}	
			
			MemberVO memberVO = (MemberVO)request.getSession().getAttribute("member");
			boardVO4.setBid(memberVO.getId());
			boardVO4.setBname(memberVO.getName());
			boardVO4.setBtel(memberVO.getTel());
			
			boardSVC4.write(boardVO4);
			
			return "redirect:/board4/list3/";
		}
		
		//매치 현황 목록
				/* @GetMapping("/list") */
				@GetMapping({"/list3",
										 "/list3/{searchType}/{keyword}"})
						
				public String listAll(
						 @PathVariable(required=false) String searchType,
						 @PathVariable(required=false) String keyword,
					
						@Valid @ModelAttribute("boardVO4") BoardVO4 boardVO4,
						BindingResult result,
						HttpServletRequest request,
						Model model) {
								
				
					//게시글 목록
				
					model.addAttribute("boardVO4", boardVO4);
					model.addAttribute("list", boardSVC4.list(searchType,keyword));
					
					
					return "board/list3";		
				}
		
		//게시글 보기
		@GetMapping("/view/{bnum}")
		public String view(
				@PathVariable String bnum,
				Model model) {
			
			Map<String,Object> map = boardSVC4.view(bnum);
			BoardVO4 boardVO4 = (BoardVO4)map.get("board4");
			logger.info(boardVO4.toString());
			
			model.addAttribute("boardVO4", boardVO4);
			
			return "/board/readForm3";
		}	
		
		//게시글 삭제
		@GetMapping("/delete/{bnum}")
		public String delete(
				@PathVariable String bnum, 
				Model model) {
			
			//1)게시글 및 첨부파일 삭제
			boardSVC4.delete(bnum);
			//2)
			model.addAttribute("list", boardSVC4.list());
			
			return "redirect:/board4/list3/";
		}
	
		//게시글 수정
		@PostMapping("/modify")
		public String modify(
				@Valid @ModelAttribute("boardVO4") BoardVO4 boardVO4,
				BindingResult result	,HttpServletResponse response
				) throws IOException {
			if(result.hasErrors()) {
				logger.info("오류발생");
				
				return "/board/readForm3";
			}
			
			logger.info("게시글 수정 내용:" + boardVO4.toString());
			boardSVC4.modify(boardVO4);
		/* return "redirect:/board3/view2/"+ boardVO2.getBnum(); */
		return "redirect:/board4/list3/";
		}
}
