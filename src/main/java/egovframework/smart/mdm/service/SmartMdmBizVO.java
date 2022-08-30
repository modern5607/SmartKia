package egovframework.smart.mdm.service;

import egovframework.com.cmm.ComDefaultVO;

public class SmartMdmBizVO extends ComDefaultVO {
	
    private static final long serialVersionUID = 1L;
    
    private String Custid = "";
    //업체명
	private String Custnm = "";
    private String Address = "";
    private String Tel = "";
    //담당자
    private String Custname = "";
    private String Item = "";
    private String Remark = "";
    private String Useyn = "";
    private String Custtype = "";
    
    public String getCusttype() {
		return Custtype;
	}
	public void setCusttype(String custtype) {
		Custtype = custtype;
	}
    public String getCustid() {
		return Custid;
	}
	public void setCustid(String custid) {
		Custid = custid;
	}
	public String getCustnm() {
		return Custnm;
	}
	public void setCustnm(String custnm) {
		Custnm = custnm;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getTel() {
		return Tel;
	}
	public void setTel(String tel) {
		Tel = tel;
	}
	public String getCustname() {
		return Custname;
	}
	public void setCustname(String custname) {
		Custname = custname;
	}
	public String getItem() {
		return Item;
	}
	public void setItem(String item) {
		Item = item;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public String getUseyn() {
		return Useyn;
	}
	public void setUseyn(String useyn) {
		Useyn = useyn;
	}

	
}

