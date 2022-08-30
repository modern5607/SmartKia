package egovframework.smart.monitoring.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.smart.monitoring.service.SmartMonitoringService;

@Service("SmartMonitoringService")
public class SmartMonitoringServiceImpl extends EgovAbstractServiceImpl implements SmartMonitoringService{

	@Resource(name = "SmartMonitoringDAO")
	private SmartMonitoringDAO smartmonitoringDAO;
	
	@Override
	public Map<String, Object> selectMonitoringList(ComDefaultVO vo) throws Exception {
		System.out.println("impl");
		List<ComDefaultVO> result = smartmonitoringDAO.selectMonitoringList(vo);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultCnt", cnt);
		return map;
	}

}
