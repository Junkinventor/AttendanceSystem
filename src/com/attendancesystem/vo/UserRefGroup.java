package com.attendancesystem.vo;

import java.util.Date;

/**
 * 用户与用户组
 * 2016.5.10
 */
public class UserRefGroup {
	private int id;
	private int groupid;
	private String groupname;
	private int userid;
	private String username;
	private String description;
	private Date createdate;
	private Date updatedate;
	private String isdelete;
	
	public UserRefGroup(){
		
	}
	public UserRefGroup(int groupid, String groupname, int userid, String username, String description, Date createdate,
			Date updatedate, String isdelete) {
		super();
		this.groupid = groupid;
		this.groupname = groupname;
		this.userid = userid;
		this.username = username;
		this.description = description;
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
	public int getGroupid() {
		return groupid;
	}
	public void setGroupid(int groupid) {
		this.groupid = groupid;
	}
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
