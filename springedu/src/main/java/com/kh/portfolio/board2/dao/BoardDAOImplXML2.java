package com.kh.portfolio.board2.dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board2.vo.BoardVO2;


@Repository
public class BoardDAOImplXML2 implements BoardDAO2 {

	@Inject
	SqlSessionTemplate sqlSession;

	// 카테고리 읽어오기
	@Override
	public List<BoardCategoryVO> getCategory() {
		return sqlSession.selectList("mappers.BoardDAO2-mapper.getCategory");
	}

	// 게시글작성
	@Override
	public int write(BoardVO2 boardVO2) {
		return sqlSession.insert("mappers.BoardDAO2-mapper.write", boardVO2);
	}
	
	//게시글보기
	@Override
	public BoardVO2 view(String bnum) {
		return sqlSession.selectOne("mappers.BoardDAO2-mapper.view", Long.valueOf(bnum));
	}

	//게시글수정
		@Override
		public int modify(BoardVO2 boardVO2) {
			return sqlSession.update("mappers.BoardDAO2-mapper.modify", boardVO2);
		}

		//게시글삭제
		@Override
		public int delete(String bnum) {
			/* throw new DataAccessException(); */
			return sqlSession.delete("mappers.BoardDAO2-mapper.delete", Long.valueOf(bnum));
		}
	//게시글목록
	//1)전체
	@Override
	public List<BoardVO2> list() {
		return sqlSession.selectList("mappers.BoardDAO2-mapper.list");
	}
	
	//3)검색어 있는 게시글검색(전체,제목,내용,작성자ID,별칭)
	@Override
	public List<BoardVO2> list2(String searchType2, String keyword2) {
		Map<String,Object> map = new HashMap<>();
		map.put("searchType2",searchType2);
		if(keyword2 != null) {
			map.put("list2",Arrays.asList(keyword2.split("\\s+")));
		}
		return sqlSession.selectList("mappers.BoardDAO2-mapper.list3", map);
	}
}
