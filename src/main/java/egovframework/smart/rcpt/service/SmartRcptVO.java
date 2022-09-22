package egovframework.smart.rcpt.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.smart.mdm.service.SmartLeadTimeVO;

public class SmartRcptVO extends SmartLeadTimeVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private String repairkind="";
	private String name="";
	private String carnum="";
	private String tel="";
	private String searchcarnum="";


	public String getSearchcarnum() {
		return searchcarnum;
	}
	public void setSearchcarnum(String searchcarnum) {
		this.searchcarnum = searchcarnum;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRepairkind() {
		return repairkind;
	}
	public void setRepairkind(String repairkind) {
		this.repairkind = repairkind;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	private String checkcarnum="";
	public String getCheckcarnum() {
		return checkcarnum;
	}
	public void setCheckcarnum(String checkcarnum) {
		this.checkcarnum = checkcarnum;
	}

}
