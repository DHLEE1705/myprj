package com.kh.portfolio.board4.svc;

import java.util.List;
import java.util.Map;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board4.vo.BoardVO4;


public interface BoardSVC4 {
	//카테고리 읽어오기
		List<BoardCategoryVO> getCategory();
		
		//게시글작성
		int write(BoardVO4 boardVO4);
		
		//게시글보기
			Map<String,Object> view(String bnum);
			//게시글수정
			int modify(BoardVO4 boardVO4);

			//게시글삭제
			int delete(String bnum);
		
		//게시글목록
			//1)전체
			List<BoardVO4> list();
			//3)검색어 있는 게시글검색(요청페이지, 검색유형, 검색어)
			List<BoardVO4> list(String searchType,String keyword);
}
















