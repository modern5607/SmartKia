package egovframework.smart.rcpt.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class ReservationVO extends ComDefaultVO implements Serializable{
    private static final long serialVersionUID = 1L;

    private String custnm ="";
    private String carnum ="";
    private String carkind="";
    private String tel ="";
    private String sdate="";
    private String edate="";
    private String taskstat="";

    public String getTaskstat() {
        return taskstat;
    }
    public void setTaskstat(String taskstat) {
        this.taskstat = taskstat;
    }
    public String getCustnm() {
        return custnm;
    }
    public void setCustnm(String custnm) {
        this.custnm = custnm;
    }
    public String getCarnum() {
        return carnum;
    }
    public void setCarnum(String carnum) {
        this.carnum = carnum;
    }
    public String getCarkind() {
        return carkind;
    }
    public void setCarkind(String carkind) {
        this.carkind = carkind;
    }
    public String getTel() {
        return tel;
    }
    public void setTel(String tel) {
        this.tel = tel;
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

}
