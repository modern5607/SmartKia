package egovframework.smart.monitoring.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.smart.monitoring.service.SmartMonitoringService;
import egovframework.smart.monitoring.service.SmartMonitoringVO;

@Service("SmartMonitoringService")
public class SmartMonitoringServiceImpl extends EgovAbstractServiceImpl implements SmartMonitoringService{

	@Resource(name = "SmartMonitoringDAO")
	private SmartMonitoringDAO smartmonitoringDAO;
	
	@Override
	public Map<String, Object> selectMonitoringList(ComDefaultVO vo) throws Exception {
		
		List<ComDefaultVO> result = smartmonitoringDAO.selectMonitoringList(vo);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultCnt", cnt);
		return map;
	}

	@Override
	public List<Object> SceneMonitoring(String Team) throws Exception {
		List<Object> result = smartmonitoringDAO.SceneMonitoring(Team);
		return result;
	}

	@Override
	public List<Object> GuestMonitoring() throws Exception {
		List<Object> result = smartmonitoringDAO.GuestMonitoring();
		return result;
	}

}
