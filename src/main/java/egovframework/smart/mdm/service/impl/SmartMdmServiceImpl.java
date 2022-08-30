package egovframework.smart.mdm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.uss.olh.qna.service.QnaManageVO;
import egovframework.smart.mdm.service.SmartMdmBizVO;
import egovframework.smart.mdm.service.SmartMdmService;

@Service("SmartMdmService")
public class SmartMdmServiceImpl extends EgovAbstractServiceImpl implements SmartMdmService{

	@Resource(name = "SmartMdmDAO")
	private SmartMdmDAO smartDAO;
	
	@Override
	public Map<String, Object> selectCommonCodeList(ComDefaultVO vo) throws Exception {
		System.out.println("impl");
		List<ComDefaultVO> result = smartDAO.selectCommonCodeList(vo);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultCnt", cnt);
		return map;
	}
	

	@Override
	public Map<String, Object> selectBizList(SmartMdmBizVO vo) throws Exception {

		List<SmartMdmBizVO> result = smartDAO.selectBizList(vo);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultCnt", cnt);
		return map;
	}


	@Override
	public int insertaddBiz(SmartMdmBizVO vo) throws Exception {
		int result = smartDAO.insertaddBiz(vo);	
		return result;
	}


	@Override
	public int checkCustid(String checkId) throws Exception {
		return smartDAO.checkCustid(checkId);
	}


}
