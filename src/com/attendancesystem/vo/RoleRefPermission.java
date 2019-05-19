package com.attendancesystem.vo;

import java.util.Date;

public class RoleRefPermission {
	private int id;
	private int roleid;
	private String rolename;
	private int permissionid;
	private String permissionname;
	private String category;
	private Date createdate;
	private Date updatedate;
	private String isdelete;
	
	public RoleRefPermission(){
		
	}
	public RoleRefPermission(int roleid, String rolename, int permissionid, String permissionname, String category,
			Date createdate, Date updatedate, String isdelete) {
		super();
		this.roleid = roleid;
		this.rolename = rolename;
		this.permissionid = permissionid;
		this.permissionname = permissionname;
		this.category = category;
		this.createdate = createdate;
		this.updatedate = updatedate;
		this.isdelete = isdelete;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public int getPermissionid() {
		return permissionid;
	}
	public void setPermissionid(int permissionid) {
		this.permissionid = permissionid;
	}
	public String getPermissionname() {
		return permissionname;
	}
	public void setPermissionname(String permissionname) {
		this.permissionname = permissionname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
}
