package com.kh.portfolio.board2.svc;
/*
 * 용병모집
 */

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
import com.kh.portfolio.board2.dao.BoardDAO2;
import com.kh.portfolio.board2.vo.BoardVO2;


@Service
public class BoardSVCImpl2 implements BoardSVC2 {
	
	public static final Logger logger 
		= LoggerFactory.getLogger(BoardSVCImpl2.class);
	
	@Inject
	BoardDAO2 boardDAO2;
	
	//카테고리 읽어오기
	@Override
	public List<BoardCategoryVO> getCategory() {
		return boardDAO2.getCategory();
	}
	//게시글작성
	/* @Transactional */ //메소드내에 다른 실행 메소드가 여러개일 경우 하나가 성공하고 다음 메소드가 실패할경우 처음성공한 하나도 다시 롤백시켜주기위함
	@Override
	public int write(BoardVO2 boardVO2) {
		//1) 게시글 작성
		int cnt = boardDAO2.write(boardVO2);

		//2) bnum 가져오기 => mybatis: selectkey 사용
	
		return cnt;
	}
	
	//게시글보기
		@Transactional
		@Override
		public Map<String,Object> view(String bnum) {
			//1) 게시글 가져오기
			BoardVO2 boardVO2 = boardDAO2.view(bnum);
			
			
			Map<String,Object> map = new HashMap<>();
			map.put("board2", boardVO2);
			
			return map;
		}
	
		//게시글수정
		@Transactional
		@Override
		public int modify(BoardVO2 boardVO2) {
			//1) 게시글 수정
			int cnt = boardDAO2.modify(boardVO2);
			
			return cnt;
		}
		//게시글삭제
		@Transactional
		@Override
		public int delete(String bnum) {
			int cnt = 0;
			
			cnt = boardDAO2.delete(bnum);
			return cnt;
		}
		
		//게시글목록
		//1)전체
		@Override
		public List<BoardVO2> list() {
			return boardDAO2.list();
		}
		
		//3)검색어 있는 게시글검색(요청페이지,검색유형,검색어)
		@Override
		public List<BoardVO2> list2(String searchType2, String keyword2) {	
			return boardDAO2.list2(searchType2, keyword2);
		}
	
		

}




