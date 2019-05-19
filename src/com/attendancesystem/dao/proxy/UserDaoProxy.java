package com.attendancesystem.dao.proxy;

import java.util.List;

import com.attendancesystem.dao.IUserDao;
import com.attendancesystem.dao.impl.UserDaoImpl;
/** 
*DAO������
*2016.5.10
*/
import com.attendancesystem.dbc.DatabaseConnection;
import com.attendancesystem.vo.Permission;
import com.attendancesystem.vo.Resource;
import com.attendancesystem.vo.User;
public class UserDaoProxy{
    private DatabaseConnection dbc=null;//�������ݿ�����
    private IUserDao dao=null;//����DAO�ӿ�
    public UserDaoProxy(){
    	try {
			dbc=new DatabaseConnection();//ʵ�������ݿ�����
		} catch (Exception e) {
			e.printStackTrace();
		}
    	dao=new UserDaoImpl(dbc.getConnection());
    }
	public User findLogin(User user) throws Exception{
		User ur = null;
		try {
			ur=dao.findUser(user);//������ʵ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ur;
	}
	
	public int findGoupId(int userid) throws Exception{
		int gid = -1;
		try{
			gid = dao.findGroup(userid);
		}catch(Exception e){
			e.printStackTrace();
		}
		return gid;
	}
	
	public int findRoleId(int groupid) throws Exception{
		int rid = -1;
		try{
			rid = dao.findRole(groupid);
		}catch(Exception e){
			e.printStackTrace();
		}
		return rid;
	}
	
	public List<Integer> findPermissionid(int roleid) throws Exception{
		List<Integer> permissionidlist = null;
		try{
			permissionidlist = dao.findPermissionId(roleid);
		}catch(Exception e){
			e.printStackTrace();
		}
		return permissionidlist;
	}
	
	public List<Permission> findPermission(List<Integer> permissionid) throws Exception{
		List<Permission> permissionlist = null;
		try{
			permissionlist = dao.findPermission(permissionid);
		}catch(Exception e){
			e.printStackTrace();
		}
		return permissionlist;
	}
	
	public List<Resource> findResource() throws Exception{
		List<Resource> resourcelist = null;
		try{
			resourcelist = dao.findResource();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		return resourcelist;
	}
}
