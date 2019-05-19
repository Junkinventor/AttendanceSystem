package com.attendancesystem.vo;

import java.util.Date;

public class Permission {

	private int id;
	private String name;
	private String category;
	private int pid;
	private String pcode;
	private String url;
	private String description;
	private Date createdate;
	private Date updatedate;
	private String isdelete;
	
	public Permission(){
		
	}
	public Permission(String name, String category, int pid, String pcode, String url, String description,
			Date createdate, Date updatedate, String isdelete) {
		super();
		this.name = name;
		this.category = category;
		this.pid = pid;
		this.pcode = pcode;
		this.url = url;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
