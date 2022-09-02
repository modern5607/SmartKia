package egovframework.smart.mdm.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class SmartCommonCodeVO extends ComDefaultVO implements Serializable {

	private static final long serialVersionUID = 1L;
	private String groupcode="";
	private String groupname="";
	private String groupremark="";
	private String groupuseyn="";
	private String groupord="";
	private String code="";
	private String name="";
	private String col1="";
	private String col2="";
	private String remark="";
	private String useyn="";
	private String ord="";
	private String previouscode="";
	
	private String previousgroupcode="";
	private String currentid="";
	private String searchCode="";
	
	private String searchCodename="";

    
	private int pageIndex = 1;
    private int pageUnit = 10;
    private int pageSize = 10;
    private int firstIndex = 1;
    private int lastIndex = 1;
    private int recordCountPerPage = 10;	
	
	public String getCurrentid() {
		return currentid;
	}
	public void setCurrentid(String currentid) {
		this.currentid = currentid;
	}
	public String getGroupcode() {
		return groupcode;
	}
	public void setGroupcode(String groupcode) {
		this.groupcode = groupcode;
	}
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	public String getGroupremark() {
		return groupremark;
	}
	public void setGroupremark(String groupremark) {
		this.groupremark = groupremark;
	}
	public String getGroupuseyn() {
		return groupuseyn;
	}
	public void setGroupuseyn(String groupuseyn) {
		this.groupuseyn = groupuseyn;
	}
	public String getGroupord() {
		return groupord;
	}
	public void setGroupord(String groupord) {
		this.groupord = groupord;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCol1() {
		return col1;
	}
	public void setCol1(String col1) {
		this.col1 = col1;
	}
	public String getCol2() {
		return col2;
	}
	public void setCol2(String col2) {
		this.col2 = col2;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public String getOrd() {
		return ord;
	}
	public void setOrd(String ord) {
		this.ord = ord;
	}
	public String getPreviouscode() {
		return previouscode;
	}
	public void setPreviouscode(String previouscode) {
		this.previouscode = previouscode;
	}

	public String getSearchCode() {
		return searchCode;
	}
	public void setSearchCode(String searchCode) {
		this.searchCode = searchCode;
	}
	public String getSearchCodename() {
		return searchCodename;
	}
	public void setSearchCodename(String searchCodename) {
		this.searchCodename = searchCodename;
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
	public String getPreviousgroupcode() {
		return previousgroupcode;
	}
	public void setPreviousgroupcode(String previousgroupcode) {
		this.previousgroupcode = previousgroupcode;
	}
	

}
