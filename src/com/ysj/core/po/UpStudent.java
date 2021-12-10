package com.ysj.core.po;

public class UpStudent {
	private String sId;
	
    private String sName;
    
    private String dept;
   
    private String majorId;
    
    private String sclass;

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getMajorId() {
		return majorId;
	}

	public void setMajorId(String majorId) {
		this.majorId = majorId;
	}

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	@Override
	public String toString() {
		return "UpStudent [sId=" + sId + ", sName=" + sName + ", dept=" + dept + ", majorId=" + majorId + ", sclass="
				+ sclass + "]";
	}

}