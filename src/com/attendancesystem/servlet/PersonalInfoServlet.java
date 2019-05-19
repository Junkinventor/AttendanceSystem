package com.attendancesystem.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.attendancesystem.constant.Constant;
import com.attendancesystem.dao.proxy.UserDaoProxy;

/**
 * 用户
 */
@WebServlet("/PersonalInfoServlet")
public class PersonalInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PersonalInfoServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		      String uid = request.getParameter("uid");//userid
		      String ptype = request.getParameter("ptype");
		      //个人资料请求
		      UserDaoProxy userDaoProxy = null;
			if(ptype.equals(Constant.PERSONAL_INFO)){
				//userDaoProxy = new UserDaoProxy();
				//查询个人资料
				HttpSession session=request.getSession();
				session.removeAttribute("content_jsp");
				session.setAttribute("content_jsp", "/page/user/personalInfo.jsp");
				request.getRequestDispatcher("/index.jsp").forward(request,response);//跳转
				//response.sendRedirect(request.getContextPath()+"/index.jsp");
				return;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
