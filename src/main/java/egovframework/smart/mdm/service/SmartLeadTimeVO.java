package egovframework.smart.mdm.service;

import java.io.Serializable;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;

public class SmartLeadTimeVO extends ComDefaultVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private String main = "";
	private String middle = "";
	private String sub = "";

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
}
