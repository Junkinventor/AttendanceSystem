package com.attendancesystem.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.attendancesystem.dao.IUserDao;
import com.attendancesystem.vo.Permission;
import com.attendancesystem.vo.Resource;
import com.attendancesystem.vo.User;

/**
 * 2016.5.10
 */
public class UserDaoImpl implements IUserDao{
	private Connection conn=null;//�������ݿ����Ӷ��� 
	private PreparedStatement pstmt=null;//�������ݿ��������
	public UserDaoImpl(Connection conn){ //�������ݿ�����
		this.conn=conn;
	}
	//��¼
	@Override
	public User findUser(User user){
		ResultSet rSet = null;
		User ur = null;
		try {
			String sql="select user_id,user_name,user_alias from user where user_name=? and password=?";
			pstmt=conn.prepareStatement(sql);//ʵ��������
			pstmt.setString(1,user.getUsername());
		    pstmt.setString(2, user.getPassword());
		    rSet=pstmt.executeQuery();//ȡ�ý�� 
		    if(rSet != null){
		    	ur = new User();
		    	while(rSet.next()){
		    		ur.setUserid(rSet.getInt("user_id"));
		    		ur.setUseralias(rSet.getString("user_alias"));
		    		ur.setUsername(rSet.getString("user_name"));
		    	}
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ur;
	}
	//��ѯ�û���
	@Override
	public int findGroup(int userId){
		ResultSet rSet = null;
		int gid = -1;
		try {
			String sql="select group_id from user_ref_group where user_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			rSet=pstmt.executeQuery();
		    if(rSet != null){
		    	while(rSet.next()){
		    		gid = rSet.getInt("group_id");
		    	}
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gid;
	}
	//��ѯ��ɫ
	@Override
	public int findRole(int groupid){
		ResultSet rSet = null;
		int rid = -1;
		try {
			String sql="select role_id from usergroup_ref_role where group_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, groupid);
			rSet=pstmt.executeQuery();
		    if(rSet != null){
		    	while(rSet.next()){
		    		rid = rSet.getInt("role_id");
		    	}
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rid;
	}
	
	//��ȡ���˵�id
	@Override
	public List<Integer> findPermissionId(int roleid){
		ResultSet rSet = null;
		List<Integer> permissionidlist = null;
		try {
			String sql="select permission_id from role_ref_permission where role_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, roleid);
			rSet=pstmt.executeQuery();
		    if(rSet != null){
		    	permissionidlist = new ArrayList<Integer>();
		    	while(rSet.next()){
		    		permissionidlist.add(rSet.getInt("permission_id"));
		    	}
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return permissionidlist;
	}
	
	//��ȡ���˵��б�
	@Override
	public List<Permission> findPermission(List<Integer> permissionid){
		ResultSet rSet = null;
		List<Permission> permissionlist = new ArrayList<Permission>();;
		Permission permission = null;
		try {
			for(int i : permissionid){
				String sql="select id,pid,name,url from permission where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, i);
				rSet=pstmt.executeQuery();
				if(rSet != null){
					permission = new Permission();
					while(rSet.next()){
						permission.setId(rSet.getInt("id"));
						permission.setPid(rSet.getInt("pid"));
						permission.setName(rSet.getString("name"));
						permission.setUrl(rSet.getString("url"));
					}
					permissionlist.add(permission);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return permissionlist;
	}
		
	//��ȡ�Ӳ˵��б�
		@Override
		public List<Resource> findResource(){
			ResultSet rSet = null;
			List<Resource> resourcelist = new ArrayList<Resource>();;
			Resource resource = null;
			try {
				String sql="select id,pid,name,url from resource";
				pstmt=conn.prepareStatement(sql);
				rSet=pstmt.executeQuery();
				if(rSet != null){
					while(rSet.next()){
						resource = new Resource();
						resource.setId(rSet.getInt("id"));
						resource.setPid(rSet.getInt("pid"));
						resource.setName(rSet.getString("name"));
						resource.setUrl(rSet.getString("url"));
						resourcelist.add(resource);
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				//�رղ���
				if(pstmt!=null){
					try {
						pstmt.close();
						conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					}	
				}
			}
			return resourcelist;
		}	
}
