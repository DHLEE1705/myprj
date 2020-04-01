package com.kh.portfolio.board4.svc;
/*매치등록, 매치 게시판*/
import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.portfolio.board4.dao.RboardDAO4;
import com.kh.portfolio.board4.vo.RboardVO4;

@Service
public class RboardSVCImpl4 implements RboardSVC4 {
	
	final static Logger logger 
		= LoggerFactory.getLogger(RboardSVCImpl4.class);
	
	@Inject
	RboardDAO4 rboardDAO4;
	
	//댓글 작성
	@Override
	public int write(RboardVO4 rboardVO4) {

		return rboardDAO4.write(rboardVO4);
	}
	//댓글 목록
	@Override
	public List<RboardVO4> list(int bnum, int startRec, int endRec) {

		return rboardDAO4.list(bnum, startRec, endRec);
	}
	//댓글 수정
	@Override
	public int modify(RboardVO4 rboardVO4) {

		return rboardDAO4.modify(rboardVO4);
	}
	//댓글 삭제
	@Override
	public int delete(String rnum) {

		return rboardDAO4.delete(rnum);
	}
	//대댓글 작성
	@Transactional
	@Override
	public int reply(RboardVO4 rboardVO4) {
		//1) 부모글 정보 읽어오기
		RboardVO4 parentRboardVO = rboardDAO4.replyView(rboardVO4.getPrnum());
		//2) 이전댓글 step 업데이트
		rboardDAO4.updateStep(parentRboardVO.getRgroup(), parentRboardVO.getRstep());
		//3) 대댓글 작성
		rboardVO4.setBnum(parentRboardVO.getBnum());
		rboardVO4.setRgroup(parentRboardVO.getRgroup());
		rboardVO4.setRstep(parentRboardVO.getRstep());
		rboardVO4.setRindent(parentRboardVO.getRindent());
		//부모댓글아이디
		rboardVO4.setPrid(parentRboardVO.getRid());
		//부모댓글별칭
		rboardVO4.setPrname(parentRboardVO.getRname());
		return rboardDAO4.reply(rboardVO4);
	}
	
	//댓글 총계
	@Override
	public int replyTotalRec(String bnum) {

		return rboardDAO4.replyTotalRec(bnum);
	}

}
