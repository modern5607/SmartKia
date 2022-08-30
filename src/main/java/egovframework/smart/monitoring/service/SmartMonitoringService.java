package egovframework.smart.monitoring.service;

import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;

public interface SmartMonitoringService {
	
	public Map<String, Object> selectMonitoringList(ComDefaultVO vo) throws Exception;
	

}
