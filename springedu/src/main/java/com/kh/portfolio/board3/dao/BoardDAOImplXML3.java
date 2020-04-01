package com.kh.portfolio.board3.dao;
/*
 * 용병신청
 */
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board3.vo.BoardVO3;

@Repository
public class BoardDAOImplXML3 implements BoardDAO3 {

	@Inject
	SqlSessionTemplate sqlSession;

	// 카테고리 읽어오기
	@Override
	public List<BoardCategoryVO> getCategory() {
		return sqlSession.selectList("mappers.BoardDAO3-mapper.getCategory");
	}

	// 게시글작성
	@Override
	public int write(BoardVO3 boardVO3) {
		return sqlSession.insert("mappers.BoardDAO3-mapper.write", boardVO3);
	}
	
	//게시글보기
	@Override
	public BoardVO3 view(String bnum) {
		return sqlSession.selectOne("mappers.BoardDAO3-mapper.view", Long.valueOf(bnum));
	}

	//게시글삭제
	@Override
	public int delete(String bnum) {
		/* throw new DataAccessException(); */
		return sqlSession.delete("mappers.BoardDAO3-mapper.delete", Long.valueOf(bnum));
	}
	//게시글목록
	//1)전체
	@Override
	public List<BoardVO3> list() {
		return sqlSession.selectList("mappers.BoardDAO3-mapper.list");
	}
	
	//3)검색어 있는 게시글검색(전체,제목,내용,작성자ID,별칭)
	@Override
	public List<BoardVO3> list(String searchType, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("searchType",searchType);
		if(keyword != null) {
			map.put("list",Arrays.asList(keyword.split("\\s+")));
		}
		return sqlSession.selectList("mappers.BoardDAO3-mapper.list3", map);
	}
}
