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
 * ��¼
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
			request.setAttribute("info", "�û�������Ϊ��!");//���������Ϣ
			request.getRequestDispatcher("/login.jsp").forward(request,response);//��ת
			return;
		}
		if(password==null||"".equals(password)){
			request.setAttribute("info", "���벻��Ϊ��!");//���������Ϣ
			request.getRequestDispatcher("/login.jsp").forward(request,response);//��ת
			return;
		}
		
		User user=new User();
		user.setUsername(name);;
		user.setPassword(password);
		UserDaoProxy userDaoProxy=new UserDaoProxy();
		try {
			User u = userDaoProxy.findLogin(user);
			if(u.getUsername() == null){
				request.setAttribute("info", "�û������������");//���������Ϣ
				request.getRequestDispatcher("/login.jsp").forward(request,response);//��ת
				return;
			}
			HttpSession session=request.getSession();
			session.removeAttribute("sysUser");
			session.removeAttribute("useralias");
			session.setAttribute("sysUser", u);
			session.setAttribute("useralias", u.getUseralias());
			//��ȡ�û���id
			int gid = userDaoProxy.findGoupId(u.getUserid());
			//�����û����ȡ��ɫid
			int rid = userDaoProxy.findRoleId(gid);
			//���ݽ�ɫ��ȡ�˵�id
			List<Integer> permissionidlist = userDaoProxy.findPermissionid(rid);
			//���ݲ˵�id��ȡ�˵�
			List<Permission> permissionlist = userDaoProxy.findPermission(permissionidlist);
			//��ȡ�����Ӳ˵�
			List<Resource> resourcelist = userDaoProxy.findResource();
			session.removeAttribute("permission");
			session.removeAttribute("resource");
			session.setAttribute("permission", permissionlist);//���˵�
			session.setAttribute("resource", resourcelist);//�Ӳ˵�
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/index.jsp").forward(request,response);//��ת
		//response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
}
