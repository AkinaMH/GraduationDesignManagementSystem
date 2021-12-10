package com.ysj.core.po;

public class UpExcel {
	private String tId;
	
    private String tName;
    
    private String dept;
    
    private String title;
    
    private String duties;
    
    private String power;
   
    private String major;
    
    private int tState;

	public String gettId() {
		return tId;
	}

	public void settId(String tId) {
		this.tId = tId;
	}

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDuties() {
		return duties;
	}

	public void setDuties(String duties) {
		this.duties = duties;
	}

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public int gettState() {
		return tState;
	}

	public void settState(int tState) {
		this.tState = tState;
	}

	@Override
	public String toString() {
		return "UpExcel [tId=" + tId + ", tName=" + tName + ", dept=" + dept + ", title=" + title + ", duties=" + duties
				+ ", power=" + power + ", major=" + major + ", tState=" + tState + "]";
	}

	

}