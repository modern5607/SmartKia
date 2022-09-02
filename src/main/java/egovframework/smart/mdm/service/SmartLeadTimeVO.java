package egovframework.smart.mdm.service;

import java.io.Serializable;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;

public class SmartLeadTimeVO extends ComDefaultVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private String main = "";
	private String middle = "";
	private String sub = "";
	private String leadtime = "";
	private String updatehcode = "";
	private String updatecode = "";
	private String updateleadtime = "";
	private String insertname = "";
	private String insertleadtime = "";
	private String id = "";

	public String getUpdatehcode() {
		return updatehcode;
	}

	public void setUpdatehcode(String updatehcode) {
		this.updatehcode = updatehcode;
	}
	public String getUpdatecode() {
		return updatecode;
	}

	public void setUpdatecode(String updatecode) {
		this.updatecode = updatecode;
	}
	
	public String getUpdateleadtime() {
		return updateleadtime;
	}

	public void setUpdateleadtime(String updateleadtime) {
		this.updateleadtime = updateleadtime;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMain() {
		return main;
	}

	public void setMain(String main) {
		this.main = main;
	}

	public String getMiddle() {
		return middle;
	}

	public void setMiddle(String middle) {
		this.middle = middle;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getLeadtime() {
		return leadtime;
	}

	public void setLeadtime(String leadtime) {
		this.leadtime = leadtime;
	}
	public String getInsertleadtime() {
		return insertleadtime;
	}

	public void setInsertleadtime(String insertleadtime) {
		this.insertleadtime = insertleadtime;
	}
	public String getInsertname() {
		return insertname;
	}

	public void setInsertname(String insertname) {
		this.insertname = insertname;
	}

}
