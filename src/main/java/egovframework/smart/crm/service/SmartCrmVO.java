package egovframework.smart.crm.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;


public class SmartCrmVO extends ComDefaultVO implements Serializable {


	private static final long serialVersionUID = 1L;
	

    private String cusId = "";
    
    private String cusAutoNo = "";
    
    private String cusAutoKind = "";
    
    private String cusNm = "";
    
    private String cusTel = "";
    
    private String taskStat = "";
    
    private String positon = "";
    
    private String compTime = "";
    
    private String note = "";
    
    private String turnOver = "";
    
    private String turnoverTime = "";
  
    private String turnoverNote = "";
    
    private String searchAutoNo = "";
    
    private String searchCusNm = "";
    
    private String searchCusTel = "";
    

    private String sdate = "";
    private String edate = "";
    
	private int pageIndex = 1;
    private int pageUnit = 10;
    private int pageSize = 10;
    private int firstIndex = 1;
    private int lastIndex = 1;
    private int recordCountPerPage = 10;
    
	public String getSearchAutoNo() {
		return searchAutoNo;
	}
	public void setSearchAutoNo(String searchAutoNo) {
		this.searchAutoNo = searchAutoNo;
	}
	public String getSearchCusNm() {
		return searchCusNm;
	}
	public void setSearchCusNm(String searchCusNm) {
		this.searchCusNm = searchCusNm;
	}
	public String getSearchCusTel() {
		return searchCusTel;
	}
	public void setSearchCusTel(String searchCusTel) {
		this.searchCusTel = searchCusTel;
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

	public String getCusId() {
		return cusId;
	}
	public void setCusId(String cusId) {
		this.cusId = cusId;
	}
	public String getCusAutoNo() {
		return cusAutoNo;
	}
	public void setCusAutoNo(String cusAutoNo) {
		this.cusAutoNo = cusAutoNo;
	}
	public String getCusAutoKind() {
		return cusAutoKind;
	}
	public void setCusAutoKind(String cusAutoKind) {
		this.cusAutoKind = cusAutoKind;
	}
	public String getCusNm() {
		return cusNm;
	}
	public void setCusNm(String cusNm) {
		this.cusNm = cusNm;
	}
	public String getCusTel() {
		return cusTel;
	}
	public void setCusTel(String cusTel) {
		this.cusTel = cusTel;
	}
	public String getTaskStat() {
		return taskStat;
	}
	public void setTaskStat(String taskStat) {
		this.taskStat = taskStat;
	}
	public String getPositon() {
		return positon;
	}
	public void setPositon(String positon) {
		this.positon = positon;
	}
	public String getCompTime() {
		return compTime;
	}
	public void setCompTime(String compTime) {
		this.compTime = compTime;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getTurnOver() {
		return turnOver;
	}
	public void setTurnOver(String turnOver) {
		this.turnOver = turnOver;
	}
	public String getTurnoverTime() {
		return turnoverTime;
	}
	public void setTurnoverTime(String turnoverTime) {
		this.turnoverTime = turnoverTime;
	}
	public String getTurnoverNote() {
		return turnoverNote;
	}
	public void setTurnoverNote(String turnoverNote) {
		this.turnoverNote = turnoverNote;
	}	
	
	
}