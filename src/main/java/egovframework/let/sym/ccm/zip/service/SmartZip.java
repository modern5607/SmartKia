package egovframework.let.sym.ccm.zip.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

	/**
	 * 우편번호 모델 클래스
	 * @author 공통서비스 개발팀 이중호
	 * @since 2009.04.01
	 * @version 1.0
	 * @see
	 *
	 * <pre>
	 * << 개정이력(Modification Information) >>
	 *   
	 *   수정일      수정자           수정내용
	 *  -------    --------    ---------------------------
	 *   2009.04.01  이중호          최초 생성
	 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성 
	 *
	 * </pre>
	 */
	public class SmartZip implements Serializable {
	
		/**
		 * serialVersionUID
		 */
		private static final long serialVersionUID = 1L;
	
		/*
		 * 우편번호
		 */
	    private String postCd            = "";
	    
	    /*
	     * 시도명
	     */
		private String sido       = "";
		
		/*
		 * 시군구명
		 */
	    private String sigungu       = "";
	    
	    /*
	     * 도로명
	     */
	    private String doro          = "";
	    
	    /*
	     * 건물번호 본번
	     */
	    private String kenmulm      = "";
	    
	    /*
	     * 건물번호 부번
	     */
	    private String kenmuls     = "";
	
	    /*
	     * 최초등록자ID
	     */
	    private String frstRegisterId = "";
	    
	    /*
	     * 최종수정자ID
	     */
	    private String lastUpdusrId   = "";
	
		/**
		 * zip attribute 를 리턴한다.
		 * @return String
		 */
		
	
		/**
		 * frstRegisterId attribute 를 리턴한다.
		 * @return String
		 */
		public String getFrstRegisterId() {
			return frstRegisterId;
		}
	
		public String getPostCd() {
			return postCd;
		}
	
		public void setPostCd(String postCd) {
			this.postCd = postCd;
		}
		
		public String getSido() {
			return sido;
		}
	
		public void setSido(String sido) {
			this.sido = sido;
		}
	
		public String getSigungu() {
			return sigungu;
		}
	
		public void setSigungu(String sigungu) {
			this.sigungu = sigungu;
		}
	
		public String getDoro() {
			return doro;
		}
	
		public void setDoro(String doro) {
			this.doro = doro;
		}
		
		public String getKenmulm() {
			return kenmulm;
		}

		public void setKenmulm(String kenmulm) {
			this.kenmulm = kenmulm;
		}

		public String getKenmuls() {
			return kenmuls;
		}

		public void setKenmuls(String kenmuls) {
			this.kenmuls = kenmuls;
		}

		/**
		 * frstRegisterId attribute 값을 설정한다.
		 * @param frstRegisterId String
		 */
		public void setFrstRegisterId(String frstRegisterId) {
			this.frstRegisterId = frstRegisterId;
		}
	
		/**
		 * lastUpdusrId attribute 를 리턴한다.
		 * @return String
		 */
		public String getLastUpdusrId() {
			return lastUpdusrId;
		}
	
		/**
		 * lastUpdusrId attribute 값을 설정한다.
		 * @param lastUpdusrId String
		 */
		public void setLastUpdusrId(String lastUpdusrId) {
			this.lastUpdusrId = lastUpdusrId;
		}
	
		/**
	     * toString 메소드를 대치한다.
	     */
	    public String toString() {
	    	return ToStringBuilder.reflectionToString(this);
	    }
	    
	}

