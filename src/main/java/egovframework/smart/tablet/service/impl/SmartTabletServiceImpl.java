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

	@Override
	public Map<String, Object> assignmentList(SmartTabletVO vo) throws Exception {
		List<SmartTabletVO> result = SmartTabletDAO.assignmentList(vo);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultCnt", cnt);
		return map;
	}

	@Override
	public int updateAssign(SmartTabletVO vo) throws Exception {
		 return SmartTabletDAO.updateassign(vo); 
	}

	@Override
	public Map<String,Object> checkstatus(Map<String, Object> params) {
		return SmartTabletDAO.checkstatus(params);

	}

	@Override
	public int updatestatus(Map<String, Object> params) {
		return SmartTabletDAO.updatestatus(params);
	}

	@Override
	public Map<String, Object> receiveList(SmartTabletVO searchVO) {
		List<SmartTabletVO> result = SmartTabletDAO.receiveList(searchVO);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultCnt", cnt);
		return map;
	}

	@Override
	public int Transfergroup(Map<String, Object> params) {
		
		return SmartTabletDAO.Transfergroup(params);
	}

	@Override
	public int insertlog(Map<String, Object> params)throws Exception {
		System.out.println("2");
		return SmartTabletDAO.insertlog(params);
	}

	@Override
	public Map<String, Object> detailList(SmartTabletVO vo) {
		List<SmartTabletVO> result = SmartTabletDAO.detailList(vo);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultCnt", cnt);
		return map;
	}

	
	
}
