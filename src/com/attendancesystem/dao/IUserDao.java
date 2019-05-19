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
	 * 登录
	 * @param user
	 * @return User
	 */
	public User findUser(User user);
	
	/**
	 * 查询用户组
	 * @param userId
	 * @return groupid
	 */
	public int findGroup(int userId);
	
	/**
	 * 查询用户角色
	 * @param groupid
	 * @return roleid
	 */
	public int findRole(int groupid);
	
	/**
	 * 查询主菜单id
	 * @param roleid
	 * @return list
	 */
	public List<Integer> findPermissionId(int roleid);
	
	/**
	 * 查询主菜单
	 * @param list permissionid
	 * @return list Permission
	 */
	public List<Permission> findPermission(List<Integer> permissionid);
	
	/**
	 * 查询子菜单
	 * @return list Resource
	 */
	public List<Resource> findResource();
}
