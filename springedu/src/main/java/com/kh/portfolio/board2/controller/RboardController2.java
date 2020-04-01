package com.kh.portfolio.board2.controller;
/*
 * 용병모집 게시판 댓글컨트롤러 
  */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.portfolio.board2.svc.RboardSVC2;
import com.kh.portfolio.board2.vo.RboardVO2;
import com.kh.portfolio.common.PageCriteria;
import com.kh.portfolio.common.RecordCriteria;

@RestController
@RequestMapping("/rboard2")
public class RboardController2 {

	private static Logger logger 
		= LoggerFactory.getLogger(RboardController2.class);
	
	@Inject
	RboardSVC2 rboardSVC2;
	
	//댓글 작성
	@PostMapping(value="", produces="application/json")
	public ResponseEntity<String> write(
			@RequestBody(required = true) RboardVO2 rboardVO2){
		ResponseEntity res = null;
		logger.info("write() 호출됨!");
		logger.info("rboardVO2 : " + rboardVO2.toString());
		
		//유효성체크
		if(rboardVO2.getBnum() > 0 				&&
			 rboardVO2.getRid() !=null 			&&
			 rboardVO2.getRname() !=null &&
			 rboardVO2.getRcontent() !=null) {
		
			//댓글작성
			rboardSVC2.write(rboardVO2);
			//성공
			res = new ResponseEntity<String>("success",HttpStatus.OK);	//200
		}else {
			//실패
			res = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST); //400
		}
		return res;
	}
	//댓글 수정
	@PutMapping(value="", produces="application/json")
	public ResponseEntity<String> modify(
			@RequestBody(required = true) RboardVO2 rboardVO2){
		ResponseEntity<String> res = null;
		//유효성체크
		if(rboardVO2.getRcontent() != null &&
		   rboardVO2.getRnum() > 0) {
		//댓글수정
			rboardSVC2.modify(rboardVO2);
		//성공
			res = new ResponseEntity<String>("success",HttpStatus.OK);	//200
		}else {
		//실패
			res = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST); //400
		}
		return res;
	}
	//댓글 삭제
	@DeleteMapping(value="/{rnum}", produces="application/json;charset=UTF-8")
	public ResponseEntity<String> delete(
		@PathVariable(required=true) String rnum){
		
		ResponseEntity<String> res = null;
		int cnt = rboardSVC2.delete(rnum);
		if(cnt == 1) {
			res = new ResponseEntity<String>("success",HttpStatus.OK);	//200
		}else {
			res = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST); //400
		}
		return res;
	}
	//대댓글 작성
	@PostMapping(value="/reply", produces="application/json")
	public ResponseEntity<String> reply(
			@RequestBody(required = true) RboardVO2 rboardVO2){
		ResponseEntity res = null;
		logger.info("reply() 호출됨!");
		logger.info("rboardVO2 : " + rboardVO2.toString());
		
		//유효성체크
		if(
			 rboardVO2.getPrnum() > 0				&&	//부모댓글번호
			 rboardVO2.getRid() !=null 			&&
			 rboardVO2.getRname() !=null &&
			 rboardVO2.getRcontent() !=null) {
		
			//대댓글작성
			rboardSVC2.reply(rboardVO2);
			//성공
			res = new ResponseEntity<String>("success",HttpStatus.OK);	//200
		}else {
			//실패
			res = new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST); //400
		}
		return res;
	}	
	
	//댓글목록조회
	@GetMapping(value="/{page}/{bnum}", produces="application/json")
	public ResponseEntity<Map<String,Object>> list(
		@PathVariable String page,
		@PathVariable(required=true) String bnum){
		
		ResponseEntity<Map<String,Object>> res = null;
		Map<String,Object> map = new HashMap<>();
		logger.info("댓글 목록 호출됨!");		
		
		try {
			//페이지정보
			RecordCriteria rc = new RecordCriteria(Integer.valueOf(page));
			PageCriteria pc = new PageCriteria(rc, rboardSVC2.replyTotalRec(bnum));
			//댓글목록
			List<RboardVO2> list = rboardSVC2.list(Integer.valueOf(bnum), 
																					 rc.getStartRec(), 
																					 rc.getEndRec());
			map.put("pc", pc);
			map.put("list", list);
			res = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			res = new ResponseEntity<Map<String,Object>>(map, HttpStatus.BAD_REQUEST);
		}
		return res;		
	}
}
















