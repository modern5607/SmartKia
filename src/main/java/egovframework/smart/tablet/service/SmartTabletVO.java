package egovframework.smart.tablet.service;

import java.io.Serializable;
import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

public class SmartTabletVO extends ComDefaultVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private String carnum = "";
	private String Tel = "";
	private String name = "";
	private String seq = "";
	private String autoroom = "";
	private String remark = "";
	private String taskstat = "";
	private String kilro = "";
	private String searchcarnum = "";
	private String searchTel = "";
	private String searchteam = "";
	private String searchtakestat = "";

    public String getSearchtakestat() {
		return searchtakestat;
	}

	public void setSearchtakestat(String searchtakestat) {
		this.searchtakestat = searchtakestat;
	}

	public String getMembernm() {
        return membernm;
    }

    public void setMembernm(String membernm) {
        this.membernm = membernm;
    }

    private String searchdate = "";
	private String sdate = "";
	private String edate = "";
	private String newkilro ="";
	private String loginid = "";
	private String membernm="";
	

	public String getTaskstat() {
		return taskstat;
	}

	public void setTaskstat(String taskstat) {
		this.taskstat = taskstat;
	}

	public String getSearchteam() {
		return searchteam;
	}

	public void setSearchteam(String searchteam) {
		this.searchteam = searchteam;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getAutoroom() {
		return autoroom;
	}

	public void setAutoroom(String autoroom) {
		this.autoroom = autoroom;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSearchcarnum() {
		return searchcarnum;
	}

	public void setSearchcarnum(String searchcarnum) {
		this.searchcarnum = searchcarnum;
	}

	public String getSearchTel() {
		return searchTel;
	}

	public void setSearchTel(String searchTel) {
		this.searchTel = searchTel;
	}

	public String getSearchname() {
		return searchname;
	}

	public void setSearchname(String searchname) {
		this.searchname = searchname;
	}

	private String searchname = "";

	private int pageIndex = 1;
	private int pageUnit = 10;
	private int pageSize = 10;
	private int firstIndex = 1;
	private int lastIndex = 1;
	private int recordCountPerPage = 10;

	public String getTel() {
		return Tel;
	}

	public void setTel(String tel) {
		Tel = tel;
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

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchdate() {
		return searchdate;
	}

	public void setSearchdate(String searchdate) {
		this.searchdate = searchdate;
	}

	public String getKilro() {
		return kilro;
	}

	public void setKilro(String kilro) {
		this.kilro = kilro;
	}

	public String getNewkilro() {
		return newkilro;
	}

	public void setNewkilro(String newkilro) {
		this.newkilro = newkilro;
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}


}
