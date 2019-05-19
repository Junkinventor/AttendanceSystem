package com.attendancesystem.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.attendancesystem.dao.proxy.UserDaoProxy;
import com.attendancesystem.vo.Permission;
import com.attendancesystem.vo.Resource;
import com.attendancesystem.vo.User;

/**
 * 登录
 * 2016.5.10
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = -4360350510386902086L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("username");
		String password=request.getParameter("password");
		if(name==null||"".equals(name)){
			request.setAttribute("info", "用户名不能为空!");//保存错误信息
			request.getRequestDispatcher("/login.jsp").forward(request,response);//跳转
			return;
		}
		if(password==null||"".equals(password)){
			request.setAttribute("info", "密码不能为空!");//保存错误信息
			request.getRequestDispatcher("/login.jsp").forward(request,response);//跳转
			return;
		}
		
		User user=new User();
		user.setUsername(name);;
		user.setPassword(password);
		UserDaoProxy userDaoProxy=new UserDaoProxy();
		try {
			User u = userDaoProxy.findLogin(user);
			if(u.getUsername() == null){
				request.setAttribute("info", "用户名或密码错误！");//保存错误信息
				request.getRequestDispatcher("/login.jsp").forward(request,response);//跳转
				return;
			}
			HttpSession session=request.getSession();
			session.removeAttribute("sysUser");
			session.removeAttribute("useralias");
			session.setAttribute("sysUser", u);
			session.setAttribute("useralias", u.getUseralias());
			//获取用户组id
			int gid = userDaoProxy.findGoupId(u.getUserid());
			//根据用户组获取角色id
			int rid = userDaoProxy.findRoleId(gid);
			//根据角色获取菜单id
			List<Integer> permissionidlist = userDaoProxy.findPermissionid(rid);
			//根据菜单id获取菜单
			List<Permission> permissionlist = userDaoProxy.findPermission(permissionidlist);
			//获取所有子菜单
			List<Resource> resourcelist = userDaoProxy.findResource();
			session.removeAttribute("permission");
			session.removeAttribute("resource");
			session.setAttribute("permission", permissionlist);//主菜单
			session.setAttribute("resource", resourcelist);//子菜单
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/index.jsp").forward(request,response);//跳转
		//response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
}
