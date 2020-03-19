package com.kh.portfolio.board4.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board4.dao.BoardDAO4;
import com.kh.portfolio.board4.vo.BoardVO4;



@Service
public class BoardSVCImpl4 implements BoardSVC4 {
	
	public static final Logger logger 
		= LoggerFactory.getLogger(BoardSVCImpl4.class);
	
	@Inject
	BoardDAO4 boardDAO4;
	
	//카테고리 읽어오기
	@Override
	public List<BoardCategoryVO> getCategory() {
		return boardDAO4.getCategory();
	}
	//게시글작성
	/* @Transactional */ //메소드내에 다른 실행 메소드가 여러개일 경우 하나가 성공하고 다음 메소드가 실패할경우 처음성공한 하나도 다시 롤백시켜주기위함
	@Override
	public int write(BoardVO4 boardVO4) {
		//1) 게시글 작성
		int cnt = boardDAO4.write(boardVO4);

		//2) bnum 가져오기 => mybatis: selectkey 사용
	
		return cnt;
	}
	
	//게시글보기
		@Transactional
		@Override
		public Map<String,Object> view(String bnum) {
			//1) 게시글 가져오기
			BoardVO4 boardVO4 = boardDAO4.view(bnum);
			
			
			Map<String,Object> map = new HashMap<>();
			map.put("board4", boardVO4);
			
			return map;
		}
	
		//게시글수정
		@Transactional
		@Override
		public int modify(BoardVO4 boardVO4) {
			//1) 게시글 수정
			int cnt = boardDAO4.modify(boardVO4);
			
			return cnt;
		}
		//게시글삭제
		@Transactional
		@Override
		public int delete(String bnum) {
			int cnt = 0;
			
			cnt = boardDAO4.delete(bnum);
			return cnt;
		}
		
		//게시글목록
		//1)전체
		@Override
		public List<BoardVO4> list() {
			return boardDAO4.list();
		}
		
		//3)검색어 있는 게시글검색(요청페이지,검색유형,검색어)
		@Override
		public List<BoardVO4> list(String searchType, String keyword) {	
			return boardDAO4.list(searchType, keyword);
		}
	
		

}




