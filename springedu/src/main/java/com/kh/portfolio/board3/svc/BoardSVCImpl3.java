package com.kh.portfolio.board3.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board.vo.BoardFileVO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board3.dao.BoardDAO3;
import com.kh.portfolio.board3.vo.BoardVO3;
import com.kh.portfolio.common.RecordCriteria;

@Service
public class BoardSVCImpl3 implements BoardSVC3 {
	
	public static final Logger logger 
		= LoggerFactory.getLogger(BoardSVCImpl3.class);
	
	@Inject
	BoardDAO3 boardDAO3;
	
	//카테고리 읽어오기
	@Override
	public List<BoardCategoryVO> getCategory() {
		return boardDAO3.getCategory();
	}
	//게시글작성
	/* @Transactional */ //메소드내에 다른 실행 메소드가 여러개일 경우 하나가 성공하고 다음 메소드가 실패할경우 처음성공한 하나도 다시 롤백시켜주기위함
	@Override
	public int write(BoardVO3 boardVO3) {
		//1) 게시글 작성
		int cnt = boardDAO3.write(boardVO3);

		//2) bnum 가져오기 => mybatis: selectkey 사용
	
		return cnt;
	}
	
	//게시글보기
		@Transactional
		@Override
		public Map<String,Object> view(String bnum) {
			//1) 게시글 가져오기
			BoardVO3 boardVO3 = boardDAO3.view(bnum);
			
			Map<String,Object> map = new HashMap<>();
			map.put("board3", boardVO3);
			
			return map;
		}
	
	//게시글삭제
		@Transactional
		@Override
		public int delete(String bnum) {
			int cnt = 0;
			cnt = boardDAO3.delete(bnum);
			return cnt;
		}
		
		//게시글목록
		//1)전체
		@Override
		public List<BoardVO3> list() {
			return boardDAO3.list();
		}
		
		//3)검색어 있는 게시글검색(요청페이지,검색유형,검색어)
		@Override
		public List<BoardVO3> list(String searchType, String keyword) {	
			return boardDAO3.list(searchType, keyword);
		}
	
		

}




