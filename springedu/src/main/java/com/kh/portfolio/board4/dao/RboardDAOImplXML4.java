package com.kh.portfolio.board4.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.board2.dao.RboardDAO2;
import com.kh.portfolio.board4.vo.RboardVO4;

@Repository
public class RboardDAOImplXML4 implements RboardDAO4 {

	final private static Logger logger
		= LoggerFactory.getLogger(RboardDAOImplXML4.class);
	
	@Inject
	SqlSessionTemplate sqlSession;
	
	//댓글 작성
	@Override
	public int write(RboardVO4 RboardVO4) {
	
		return sqlSession.insert("mappers.RboardDAO4-mapper.write", RboardVO4);
	}

	//댓글 목록
	@Override
	public List<RboardVO4> list(int bnum, int startRec, int endRec) {
		Map<String, Object> map = new HashMap<>();
		map.put("bnum", bnum);
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		return sqlSession.selectList("mappers.RboardDAO4-mapper.list", map);
	}
	//댓글 수정
	@Override
	public int modify(RboardVO4 RboardVO4) {

		return sqlSession.update("mappers.RboardDAO4-mapper.modify", RboardVO4);
	}
	//댓글 삭제
	@Override
	public int delete(String rnum) {

		return sqlSession.delete("mappers.RboardDAO4-mapper.delete", Long.valueOf(rnum));
	}
	//대댓글 작성
	@Override
	public int reply(RboardVO4 RboardVO4) {
		return sqlSession.insert("mappers.RboardDAO4-mapper.reply", RboardVO4);
	}
	
	//이전댓글 step 업데이트
	@Override
	public int updateStep(int rgroup, int rstep) {
		Map<String,Object> map = new HashMap<>();
		map.put("rgroup", rgroup);
		map.put("rstep", rstep);
		return sqlSession.update("mappers.RboardDAO4-mapper.updateStep", map);
	}
	
	//댓글정보 읽어오기
	@Override
	public RboardVO4 replyView(long rnum) {
		return sqlSession.selectOne("mappers.RboardDAO4-mapper.replyView", rnum);
	}	
	
	
	//댓글 총계
	@Override
	public int replyTotalRec(String bnum) {
		return sqlSession.selectOne("mappers.RboardDAO4-mapper.replyTotalRec", Long.valueOf(bnum));
	}
}
