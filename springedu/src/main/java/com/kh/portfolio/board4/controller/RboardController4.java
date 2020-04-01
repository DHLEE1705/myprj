package com.kh.portfolio.board4.controller;
/*매치게시판 댓글관리 컨트롤러*/
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

import com.kh.portfolio.board4.svc.RboardSVC4;
import com.kh.portfolio.board4.vo.RboardVO4;
import com.kh.portfolio.common.PageCriteria;
import com.kh.portfolio.common.RecordCriteria;

@RestController
@RequestMapping("/rboard4")
public class RboardController4 {

	private static Logger logger 
		= LoggerFactory.getLogger(RboardController4.class);
	
	@Inject
	RboardSVC4 rboardSVC4;
	
	//댓글 작성
	@PostMapping(value="", produces="application/json")
	public ResponseEntity<String> write(
			@RequestBody(required = true) RboardVO4 rboardVO4){
		ResponseEntity res = null;
		logger.info("write() 호출됨!");
		logger.info("rboardVO4 : " + rboardVO4.toString());
		
		//유효성체크
		if(rboardVO4.getBnum() > 0 				&&
			 rboardVO4.getRid() !=null 			&&
			 rboardVO4.getRname() !=null &&
			 rboardVO4.getRcontent() !=null) {
		
			//댓글작성
			rboardSVC4.write(rboardVO4);
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
			@RequestBody(required = true) RboardVO4 rboardVO4){
		ResponseEntity<String> res = null;
		//유효성체크
		if(rboardVO4.getRcontent() != null &&
		   rboardVO4.getRnum() > 0) {
		//댓글수정
			rboardSVC4.modify(rboardVO4);
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
		int cnt = rboardSVC4.delete(rnum);
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
			@RequestBody(required = true) RboardVO4 rboardVO4){
		ResponseEntity res = null;
		logger.info("reply() 호출됨!");
		logger.info("rboardVO2 : " + rboardVO4.toString());
		
		//유효성체크
		if(
			 rboardVO4.getPrnum() > 0				&&	//부모댓글번호
			 rboardVO4.getRid() !=null 			&&
			 rboardVO4.getRname() !=null &&
			 rboardVO4.getRcontent() !=null) {
		
			//대댓글작성
			rboardSVC4.reply(rboardVO4);
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
			PageCriteria pc = new PageCriteria(rc, rboardSVC4.replyTotalRec(bnum));
			//댓글목록
			List<RboardVO4> list = rboardSVC4.list(Integer.valueOf(bnum), 
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
















