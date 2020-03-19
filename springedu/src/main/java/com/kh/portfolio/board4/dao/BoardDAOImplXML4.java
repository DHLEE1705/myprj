package com.kh.portfolio.board4.dao;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board2.vo.BoardVO2;
import com.kh.portfolio.board4.vo.BoardVO4;

@Repository
public class BoardDAOImplXML4 implements BoardDAO4 {

	@Inject
	SqlSessionTemplate sqlSession;

	// 카테고리 읽어오기
	@Override
	public List<BoardCategoryVO> getCategory() {
		return sqlSession.selectList("mappers.BoardDAO4-mapper.getCategory");
	}

	// 게시글작성
	@Override
	public int write(BoardVO4 boardVO4) {
		return sqlSession.insert("mappers.BoardDAO4-mapper.write", boardVO4);
	}
	
	//게시글보기
	@Override
	public BoardVO4 view(String bnum) {
		return sqlSession.selectOne("mappers.BoardDAO4-mapper.view", Long.valueOf(bnum));
	}

	//게시글수정
		@Override
		public int modify(BoardVO4 boardVO4) {
			return sqlSession.update("mappers.BoardDAO4-mapper.modify", boardVO4);
		}

		//게시글삭제
		@Override
		public int delete(String bnum) {
			/* throw new DataAccessException(); */
			return sqlSession.delete("mappers.BoardDAO4-mapper.delete", Long.valueOf(bnum));
		}
	//게시글목록
	//1)전체
	@Override
	public List<BoardVO4> list() {
		return sqlSession.selectList("mappers.BoardDAO4-mapper.list");
	}
	
	//3)검색어 있는 게시글검색(전체,제목,내용,작성자ID,별칭)
	@Override
	public List<BoardVO4> list(String searchType, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("searchType",searchType);
		if(keyword != null) {
			map.put("list",Arrays.asList(keyword.split("\\s+")));
		}
		return sqlSession.selectList("mappers.BoardDAO4-mapper.list3", map);
	}
}
