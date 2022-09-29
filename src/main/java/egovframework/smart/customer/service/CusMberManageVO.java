package egovframework.smart.customer.service;

/**
 * 일반회원VO클래스로서 일반회원관리 비지니스로직 처리용 항목을 구성한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  JJY            최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성 
 *
 * </pre>
 */
public class CusMberManageVO extends CusMberDefaultVO{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	
	private String cusId = "";
	private String cusNm = "";
	private String autoNo = "";
	private String autoKind = "";
	private String cusTel = "";
	private String useYN = "";
	private String note = "";
	private String autoInt = "";
	private String totalKm = "";
	private String buildKia = "";
	

    private String oldCusNm = "";
	public String getCusId() {
		return cusId;
	}
	public void setCusId(String cusId) {
		this.cusId = cusId;
	}
	public String getCusNm() {
		return cusNm;
	}
	public void setCusNm(String cusNm) {
		this.cusNm = cusNm;
	}
	public String getAutoNo() {
		return autoNo;
	}
	public void setAutoNo(String autoNo) {
		this.autoNo = autoNo;
	}
	public String getAutoKind() {
		return autoKind;
	}
	public void setAutoKind(String autoKind) {
		this.autoKind = autoKind;
	}
	public String getCusTel() {
		return cusTel;
	}
	public void setCusTel(String cusTel) {
		this.cusTel = cusTel;
	}
	public String getUseYN() {
		return useYN;
	}
	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getAutoInt() {
		return autoInt;
	}
	public void setAutoInt(String autoInt) {
		this.autoInt = autoInt;
	}
	public String getTotalKm() {
		return totalKm;
	}
	public void setTotalKm(String totalKm) {
		this.totalKm = totalKm;
	}
	public String getBuildKia() {
		return buildKia;
	}
	public void setBuildKia(String buildKia) {
		this.buildKia = buildKia;
	}
	public String getOldCusNm() {
		return oldCusNm;
	}
	public void setOldCusNm(String oldCusNm) {
		this.oldCusNm = oldCusNm;
	}
	
}