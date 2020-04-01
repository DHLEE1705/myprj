package com.kh.portfolio.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.portfolio.common.Code;
import com.kh.portfolio.member.svc.MemberSVC;
import com.kh.portfolio.member.vo.MemberVO;

//RequestMapping,PostMapping 은 클래스레벨이나 메소드레벨 둘다 에서 쓰일 수 있지만 getMapping은 메소드 레벨에서만 쓰인다.
@Controller
@RequestMapping("/member")

public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberSVC memberSVC;
	
	@ModelAttribute //커맨드 객체 이름바꾸는 어노테이션, 여러뷰에서 공통으로 참조가능
	public void initData(Model model) {
		//지역
		List<Code> region = new ArrayList<>();
		region.add(new Code("울산(남구)", "울산(남구)"));
		region.add(new Code("울산(동구)", "울산(동구)"));
		region.add(new Code("울산(북구)", "울산(북구)"));
		region.add(new Code("울산(중구)", "울산(중구)"));
		region.add(new Code("부산(남구)", "부산(남구)"));
		region.add(new Code("부산(동래구)", "부산(동래구)"));
		region.add(new Code("부산(수영구)", "부산(수영구)"));
		region.add(new Code("부산(해운대구)", "부산(해운대구)"));
		model.addAttribute("region", region);
		
		//성별
		List<Code> gender = new ArrayList<>();
		gender.add(new Code("남","남자"));
		gender.add(new Code("여","여자"));
		
		model.addAttribute("gender",gender);
	}

	//회원 가입 양식
	@RequestMapping("/joinForm") //위의 RequestMapping에 /member + 이경로
	public String memberJoinForm(Model model) {
		model.addAttribute("mvo", new MemberVO());
		return "member/joinForm";
	}
	
	//회원 등록
	@RequestMapping("/join")
	public String memberJoin(
			@Valid @ModelAttribute("mvo") MemberVO memberVO,
			BindingResult result,
			Model model) {
		logger.info(memberVO.toString());
		
		//유효성 오류체크 중 오류가 발견되면 회원 가입 페이지로 이동
		if(result.hasErrors()) {
			return "member/joinForm";
		}
		
		//2)회원 중복체크
		if(memberSVC.selectMember(memberVO.getId()) != null) {
			model.addAttribute("svr_msg", "중복된 아이디입니다!");
			return "member/joinForm";
		}
		else {
			model.addAttribute("svr_msg", "가입이 완료되었습니다. 로그인 해주세요!");
		}
		
		//3)회원 가입처리
		int cnt = memberSVC.joinMember(memberVO);
		if(cnt == 1) {
			return "member/loginForm";
		}
		else {
			return "redirect:/";
		}
	}	
		
//회원수정 양식
	@GetMapping("/modifyForm/{id:.+}") //이메일로 가입을 받았기 때문에 . 있음
	public String modifyForm(@PathVariable String id, Model model) {
		
		//1) 현재 로긴한 회원정보 읽어오기
		MemberVO memberVO = memberSVC.selectMember(id);
		logger.info("memberVO:" + memberVO);
		//비밀번호 제거
		memberVO.setPw(null);
		model.addAttribute("mvo", memberVO);		

		return "member/modifyForm";
	} 
	@GetMapping("/file/{id:.+}")
	public ResponseEntity<byte[]> getFile(@PathVariable String id){
		MemberVO memberVO = memberSVC.selectMember(id);
		logger.info("getFile " + memberVO.toString());
		final HttpHeaders headers = new HttpHeaders();
			
			String filename = null;
			try {
				filename = new String(memberVO.getFname().getBytes("euc-kr"), "ISO-8859-1");			
			}
			catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			headers.setContentDispositionFormData("attachment", filename);
			
		return new ResponseEntity<byte[]>(memberVO.getFdata(), headers, HttpStatus.OK);
	}
	//회원수정
	@PostMapping("/modify")
	public String modify(
			@Valid @ModelAttribute("mvo") MemberVO memberVO,
			BindingResult result,
			HttpSession session,
			Model model
			) throws IOException {
		logger.info("/modify호출됨!");
		//유효성 체크
		if(result.hasErrors()) {
			logger.info(result.getAllErrors().toString());
			//비밀번호 제거
			memberVO.setPw(null);
			return "member/modifyForm";
		}		
		//회원정보수정
		int cnt = memberSVC.modifyMember(memberVO);
		logger.info("수정처리결과 :" + cnt);
		if(cnt==1) {
			//세션정보 수정
			session.removeAttribute("member");	
			session.setAttribute("member", memberVO);
			
			return "redirect:/member/modifyForm/"+memberVO.getId();
		}
		else {
			model.addAttribute("svr_msg", "비밀번호가 일치하지 않습니다.!");
			return "member/modifyForm";
		}
	}
	

		//회원탈퇴 양식
	@GetMapping("/outForm")
	public String outForm() {
		
		return "member/outForm";
	}
	
	//회원 탈퇴 처리
	@PostMapping("/out")
	public String out(
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			HttpSession session,
			Model model){
			
			int cnt = memberSVC.outMember(id, pw);
			if(cnt == 1) {
				session.invalidate();
				return "redirect:/";
			}
			
			model.addAttribute("svr_msg", "비밀번호가 잘못되었습니다.!");
			
			return "member/outForm";
		}
	
	//아이디 찾기 양식
	@GetMapping("/findIDForm")
	public String findIDForm() {
		return "member/findIDForm";
	}

	//아이디 찾기 post방식
	@PostMapping(value="/id",produces = "application/json")
	@ResponseBody
	public ResponseEntity<Map> findId(
			@RequestBody MemberVO memberVO
			){
		ResponseEntity<Map> res = null;
		String findId = null;
		logger.info("tel:"+memberVO.getTel());
		logger.info("birth:"+memberVO.getBirth());
		
		//java.sql.Date타입으로 변환
		memberVO.setBirth(java.sql.Date.valueOf(memberVO.getBirth().toString()));
		//아이디 찾기 service 호출
		findId = memberSVC.findID(memberVO.getTel(),memberVO.getBirth());
		Map<String,Object> map = new HashMap();
		if(findId != null) {
			map.put("success",true);
			map.put("id",findId);
			res = new ResponseEntity<Map>(map, HttpStatus.OK);  // 200
		}else {
			map.put("success",false);
			map.put("id",findId);
			map.put("msg","찾고자하는 아이디가 없습니다!");
			res = new ResponseEntity<Map>(map, HttpStatus.OK); //200
		}
		return res;
	}	
	
	//비밀번호 변경 화면
	@GetMapping("/findPWForm")
	public String findPwForm() {
		return "member/findPWForm";
	}
	
	//비밀번호 변경 대상 찾기
	@PostMapping(value ="/findPW", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map> findPW(
			@RequestBody MemberVO memberVO){
		ResponseEntity<Map> res = null;
		logger.info("비밀번호변경 대상 찾기요청:"+memberVO);
		//1)
		
		//2)비밀번호 변경
		memberVO.setBirth(java.sql.Date.valueOf(memberVO.getBirth().toString()));
		int cnt = memberSVC.findPW(memberVO);
		Map<String, Boolean> map = new HashMap<>();
		if(cnt == 1) {
			map.put("success", true);
			res = new ResponseEntity<Map>(map, HttpStatus.OK);
		}
		else {
			map.put("success", false);
			res = new ResponseEntity<Map>(map, HttpStatus.OK);
		}
		return res;
	}
	
	//비밀번호 변경
	@PostMapping(value = "/changePW",produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map> changePW(
			@RequestBody MemberVO memberVO
			){
		ResponseEntity<Map> res = null;
		int cnt = memberSVC.changePW(memberVO.getId(), memberVO.getPw());
		Map<String, Boolean> map= new HashMap<String, Boolean>();
		if(cnt == 1) {
			map.put("success",true);
			res = new ResponseEntity<Map>(map, HttpStatus.OK);
		}
		else {
			map.put("success",false);
			res = new ResponseEntity<Map>(map, HttpStatus.OK);
		}
		return res;
	}
	
	//사진 1건 삭제
	@DeleteMapping("/file/{id:.+}")
	@ResponseBody
	public ResponseEntity<String> fileDelete(
			@PathVariable String id){
		logger.info("id="+id);
		int cnt = memberSVC.fileDelete(id);
		
		if(cnt == 1) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		else {
			return new ResponseEntity<String>("fail", HttpStatus.FAILED_DEPENDENCY);
		}
	}
}
