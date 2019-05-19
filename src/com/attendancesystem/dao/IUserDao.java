package com.attendancesystem.dao;

import java.util.List;

import com.attendancesystem.vo.Permission;
import com.attendancesystem.vo.Resource;
import com.attendancesystem.vo.User;

/**
 * 2016.5.10
 */
public interface IUserDao {
	/**
	 * ��¼
	 * @param user
	 * @return User
	 */
	public User findUser(User user);
	
	/**
	 * ��ѯ�û���
	 * @param userId
	 * @return groupid
	 */
	public int findGroup(int userId);
	
	/**
	 * ��ѯ�û���ɫ
	 * @param groupid
	 * @return roleid
	 */
	public int findRole(int groupid);
	
	/**
	 * ��ѯ���˵�id
	 * @param roleid
	 * @return list
	 */
	public List<Integer> findPermissionId(int roleid);
	
	/**
	 * ��ѯ���˵�
	 * @param list permissionid
	 * @return list Permission
	 */
	public List<Permission> findPermission(List<Integer> permissionid);
	
	/**
	 * ��ѯ�Ӳ˵�
	 * @return list Resource
	 */
	public List<Resource> findResource();
}
