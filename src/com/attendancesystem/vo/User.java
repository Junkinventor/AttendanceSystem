/** 
*2016.5.10
*/
package com.attendancesystem.vo;

import java.util.Date;

public class User {
	private int id;
	private int userid;
	private String username;
	private String useralias;
	private String password;
	private Date createdate;
	private Date updatedate;
	private String isdelete;
	
	public User(){
		
	}
	public User(int userid, String username, String useralias, String password, Date createdate, Date updatedate,
			String isdelete) {
		super();
		this.userid = userid;
		this.username = username;
		this.useralias = useralias;
		this.password = password;
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
	public String getUseralias() {
		return useralias;
	}
	public void setUseralias(String useralias) {
		this.useralias = useralias;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
