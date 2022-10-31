package egovframework.smart.monitoring.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;

public interface SmartMonitoringService {
	
	public Map<String, Object> selectMonitoringList(ComDefaultVO vo) throws Exception;

    public List<Object> SceneMonitoring(String Team)throws Exception;

    public List<Object> GuestMonitoring()throws Exception;

    public List<Object> CompleteMonitoring()throws Exception;

    public List<Object> GetMonitoringData()throws Exception;

    public List<Object> repairMonitoring()throws Exception;
	

}
