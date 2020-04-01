package com.kh.portfolio.board4.dao;
/*매치등록, 매치 게시판*/
import java.util.List;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board4.vo.BoardVO4;

public interface BoardDAO4 {
	//카테고리 읽어오기
		List<BoardCategoryVO> getCategory();
		
		//게시글작성
		int write(BoardVO4 boardVO4);
		
		//게시글보기
		BoardVO4 view(String bnum);
		//게시글수정
		int modify(BoardVO4 boardVO4);

		//게시글삭제
		int delete(String bnum);
		
		//게시글목록
			//1)전체
			List<BoardVO4> list();
			
		//3)검색어 있는 게시글검색(전체,제목,내용,작성자ID,별칭)
		List<BoardVO4> list(String searchType,String keyword);
}
