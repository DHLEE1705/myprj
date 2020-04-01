package com.kh.portfolio.board2.svc;
/*
 * 용병모집
 */

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.portfolio.board2.dao.RboardDAO2;
import com.kh.portfolio.board2.vo.RboardVO2;

@Service
public class RboardSVCImpl2 implements RboardSVC2 {
	
	final static Logger logger 
		= LoggerFactory.getLogger(RboardSVCImpl2.class);
	
	@Inject
	RboardDAO2 rboardDAO2;
	
	//댓글 작성
	@Override
	public int write(RboardVO2 rboardVO2) {

		return rboardDAO2.write(rboardVO2);
	}
	//댓글 목록
	@Override
	public List<RboardVO2> list(int bnum, int startRec, int endRec) {

		return rboardDAO2.list(bnum, startRec, endRec);
	}
	//댓글 수정
	@Override
	public int modify(RboardVO2 rboardVO2) {

		return rboardDAO2.modify(rboardVO2);
	}
	//댓글 삭제
	@Override
	public int delete(String rnum) {

		return rboardDAO2.delete(rnum);
	}
	//대댓글 작성
	@Transactional
	@Override
	public int reply(RboardVO2 rboardVO2) {
		//1) 부모글 정보 읽어오기
		RboardVO2 parentRboardVO = rboardDAO2.replyView(rboardVO2.getPrnum());
		//2) 이전댓글 step 업데이트
		rboardDAO2.updateStep(parentRboardVO.getRgroup(), parentRboardVO.getRstep());
		//3) 대댓글 작성
		rboardVO2.setBnum(parentRboardVO.getBnum());
		rboardVO2.setRgroup(parentRboardVO.getRgroup());
		rboardVO2.setRstep(parentRboardVO.getRstep());
		rboardVO2.setRindent(parentRboardVO.getRindent());
		//부모댓글아이디
		rboardVO2.setPrid(parentRboardVO.getRid());
		//부모댓글별칭
		rboardVO2.setPrname(parentRboardVO.getRname());
		return rboardDAO2.reply(rboardVO2);
	}
	
	//댓글 총계
	@Override
	public int replyTotalRec(String bnum) {

		return rboardDAO2.replyTotalRec(bnum);
	}

}
