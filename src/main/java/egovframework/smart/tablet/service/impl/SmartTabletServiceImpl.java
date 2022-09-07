package egovframework.smart.tablet.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.uss.olh.qna.service.QnaManageVO;
import egovframework.smart.mdm.service.SmartCommonCodeVO;
import egovframework.smart.mdm.service.SmartLeadTimeVO;
import egovframework.smart.mdm.service.SmartMdmBizVO;
import egovframework.smart.mdm.service.SmartMdmService;
import egovframework.smart.tablet.service.SmartTabletService;
import egovframework.smart.tablet.service.SmartTabletVO;

@Service("SmartTabletService")
public class SmartTabletServiceImpl extends EgovAbstractServiceImpl implements SmartTabletService{

	@Resource(name = "SmartTabletDAO")
	private SmartTabletDAO SmartTabletDAO;

	@Override
	public Map<String, Object> selectList(SmartTabletVO vo) throws Exception {
		
		List<SmartTabletVO> result = SmartTabletDAO.selectList(vo);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultCnt", cnt);
		return map;
	}
	
	
}
