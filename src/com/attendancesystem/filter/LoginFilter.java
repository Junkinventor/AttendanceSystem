package com.attendancesystem.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.attendancesystem.vo.User;

/**
 * 过滤器
 * 2016.5.10
 */
public class LoginFilter implements Filter{
	
	//private static final String[] IGNORE_URL= {"login.jsp","index.jsp","top.jsp","mainfra.jsp","left.jsp"};//授权地址
	
	//初始化
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	
	//过滤
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();
		String path = servletRequest.getRequestURI();
		User user = (User) session.getAttribute("sysUser");
		//登录页无需过滤
		if(path.indexOf("login.jsp") > -1) {
            chain.doFilter(servletRequest, servletResponse);
            return;
         }
//    	 boolean flag = false;
//    	 for(String s:IGNORE_URL){
//    		 if(path.contains(s)){//过滤是否合法地址
//    			 flag = true;
//    		 }
//    	 }
//    	 if(flag){
//    		 chain.doFilter(servletRequest, servletResponse);
//    	 }else{
//    		 servletResponse.sendRedirect(servletRequest.getContextPath() + "/login.jsp"); 
//			 return;
//    	 }
		//判断登录
		if(user == null){
			servletResponse.sendRedirect(servletRequest.getContextPath() + "/login.jsp"); 
			return;
		}else{
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
	}

	//销毁
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}
}
