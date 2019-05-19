package com.attendancesystem.vo;

import java.util.Date;

public class Resource {
	private int id;
	private String name;
	private String code;
	private String url;
	private int pid;
	private String pname;
	private String description;
	private Date createdate;
	private Date updatedate;
	private String isdelete;
	
	public Resource(){
		
	}
	public Resource(String name, String code, String url, int pid, String pname, String description, Date createdate,
			Date updatedate, String isdelete) {
		super();
		this.name = name;
		this.code = code;
		this.url = url;
		this.pid = pid;
		this.pname = pname;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
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
