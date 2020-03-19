package com.kh.portfolio.admin.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.portfolio.member.vo.MemberVO;


@WebFilter(description = "관리자페이지 인증필터링", urlPatterns = { "/admin/*" })
public class AdminFilter implements Filter {

    public AdminFilter() {
       System.out.println("AdminFilter()생성됨!");
    }

	public void destroy() {
		System.out.println("destroy() 호출됨!");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//전처리
		//url분석후/admin/* 요청에 대해 인증요구
		HttpServletRequest req = (HttpServletRequest)request;
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring(contextPath.length(), contextPath.length()+7);
		
//		System.out.println("uri = " + uri);
//		System.out.println("contextPath = " + contextPath);
//		System.out.println("command = " + command);
//		
		if(command.equalsIgnoreCase("/admin/")) {
			HttpSession session = req.getSession(false);
		
			//세션이 있으면
			if(session != null) {
				MemberVO memberVO = (MemberVO)session.getAttribute("member");
				
				//세션정보가 관리자인 경우
				if(memberVO!= null && memberVO.getId().equals("admin@naver.com")) {
					chain.doFilter(request, response);
					System.out.println("관리자 계정으로 접속했습니다.");
				}
				else {
					System.out.println("관리자가 아닌 사용자가 요청함!");
					((HttpServletResponse)response).sendRedirect(contextPath+"/");
					return;
				}
			}
		}
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("init() 호출됨!");
	}

}
