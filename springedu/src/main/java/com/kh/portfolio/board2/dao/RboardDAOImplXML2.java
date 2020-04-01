package com.kh.portfolio.board2.dao;
/*
 * 용병모집
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.board2.dao.RboardDAO2;
import com.kh.portfolio.board.vo.VoteVO;
import com.kh.portfolio.board2.vo.RboardVO2;

@Repository
public class RboardDAOImplXML2 implements RboardDAO2 {

	final private static Logger logger
		= LoggerFactory.getLogger(RboardDAOImplXML2.class);
	
	@Inject
	SqlSessionTemplate sqlSession;
	
	//댓글 작성
	@Override
	public int write(RboardVO2 RboardVO2) {
	
		return sqlSession.insert("mappers.RboardDAO2-mapper.write", RboardVO2);
	}

	//댓글 목록
	@Override
	public List<RboardVO2> list(int bnum, int startRec, int endRec) {
		Map<String, Object> map = new HashMap<>();
		map.put("bnum", bnum);
		map.put("startRec", startRec);
		map.put("endRec", endRec);
		return sqlSession.selectList("mappers.RboardDAO2-mapper.list", map);
	}
	//댓글 수정
	@Override
	public int modify(RboardVO2 RboardVO2) {

		return sqlSession.update("mappers.RboardDAO2-mapper.modify", RboardVO2);
	}
	//댓글 삭제
	@Override
	public int delete(String rnum) {

		return sqlSession.delete("mappers.RboardDAO2-mapper.delete", Long.valueOf(rnum));
	}
	//대댓글 작성
	@Override
	public int reply(RboardVO2 RboardVO2) {
		return sqlSession.insert("mappers.RboardDAO2-mapper.reply", RboardVO2);
	}
	
	//이전댓글 step 업데이트
	@Override
	public int updateStep(int rgroup, int rstep) {
		Map<String,Object> map = new HashMap<>();
		map.put("rgroup", rgroup);
		map.put("rstep", rstep);
		return sqlSession.update("mappers.RboardDAO2-mapper.updateStep", map);
	}
	
	//댓글정보 읽어오기
	@Override
	public RboardVO2 replyView(long rnum) {
		return sqlSession.selectOne("mappers.RboardDAO2-mapper.replyView", rnum);
	}	
	
	
	//댓글 총계
	@Override
	public int replyTotalRec(String bnum) {
		return sqlSession.selectOne("mappers.RboardDAO2-mapper.replyTotalRec", Long.valueOf(bnum));
	}
}
