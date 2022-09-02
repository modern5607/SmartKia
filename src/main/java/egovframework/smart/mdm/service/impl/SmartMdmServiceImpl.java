package egovframework.smart.mdm.service.impl;

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

@Service("SmartMdmService")
public class SmartMdmServiceImpl extends EgovAbstractServiceImpl implements SmartMdmService{

	@Resource(name = "SmartMdmDAO")
	private SmartMdmDAO smartDAO;
	
	@Override
	public Map<String, Object> selectCommonCodeList(SmartCommonCodeVO vo) throws Exception {
		//System.out.println("impl");
		List<SmartCommonCodeVO> result = smartDAO.selectCommonCodeList(vo);
		List<SmartCommonCodeVO> detail = smartDAO.selectCommonCodeDetail(vo);
		//System.out.println("DETAIL : "+detail);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultDetail", detail);
		map.put("resultCnt", cnt);
		return map;
	}
	
	// 그룹코드 하나 가져오기
	@Override
	public Map<String,Object> SelectCommonGroupCode(SmartCommonCodeVO vo) throws Exception {
		List<SmartCommonCodeVO> info = smartDAO.selectCommonGroupCode(vo);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("info",info);
		return map;
	}

	@Override
	public int InsertCommonGroupCode(SmartCommonCodeVO vo) throws Exception {
		// System.out.println("InsertCommonGroupCode impl");
		List<SmartCommonCodeVO> info = smartDAO.selectCommonGroupCode(vo);
		int result=0;
		if(info.size()==0)
		{
			result = smartDAO.insertCommonGroupCode(vo);
			System.out.println(result);
		}
		else
			System.out.println(result);
		
		return result;
	}

	@Override
	public int InsertCommonCode(SmartCommonCodeVO vo) throws Exception {
		List<SmartCommonCodeVO> info = smartDAO.selectCommonCode(vo);
		// System.out.println("VO : "+vo);
		int result=0;
		System.out.println("info : "+info);

		
		if(info.size() ==0)
		{
			result = smartDAO.insertCommonCode(vo);
			System.out.println(result);
		}
		else if(info.size() >0)
			System.out.println(result);
		
		return result;
	}

	@Override
	public int UpdateCommonGroupCode(SmartCommonCodeVO vo) throws Exception {
		int result=0;

		//System.out.println(vo.getGroupcode() +" | "+ vo.getPreviousgroupcode());
		if(vo.getGroupcode().equals(vo.getPreviousgroupcode()))
		{
			result = smartDAO.updateCommonGroupCode(vo);
		}
		else
		{
			List<SmartCommonCodeVO> info = smartDAO.selectCommonGroupCode(vo);
			
			if(info ==null)
				result = smartDAO.updateCommonGroupCode(vo);
			else
				result=0;
		}
		System.out.println("result : "+ result);
		return result;
	}

	@Override
	public Map<String, Object> SelectCommonCode(SmartCommonCodeVO vo) throws Exception {
		List<SmartCommonCodeVO> info = smartDAO.selectCommonCode(vo);
		System.out.println("info : "+info);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("info",info);
		return map;
	}

	@Override
	public Map<String,Object> selectLeadTime(SmartLeadTimeVO vo) throws Exception {
	
		List<SmartLeadTimeVO> leadtime = smartDAO.selectLeadTime(vo);
		List<SmartLeadTimeVO> main = smartDAO.selectLeadMain(vo);
		List<SmartLeadTimeVO> middle = smartDAO.selectLeadMiddle(vo);
		List<SmartLeadTimeVO> sub = smartDAO.selectLeadSub(vo);

//		System.out.println("Main : "+main);
//		System.out.println("Middle : "+middle);
//		System.out.println("Sub : "+ sub);
			
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("leadtime",leadtime);
		map.put("main",main);
		map.put("middle",middle);
		map.put("sub",sub);
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

	@Override
	public Map<String, Object> SelectCommonCustid(SmartMdmBizVO vo) throws Exception {
		List<SmartMdmBizVO> info = smartDAO.selectCommonCustid(vo);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("info",info);
		return map;
	}

	@Override
	public int UpdateBiz(SmartMdmBizVO vo) throws Exception {
		int result=0;
		System.out.println(vo);
		//System.out.println(vo.getGroupcode() +" | "+ vo.getPreviousgroupcode());
		if(vo.getCustid().equals(vo.getCustid()))
		{
			result = smartDAO.UpdateBiz(vo);
		}
		else
		{
			result=0;
		}
		System.out.println("result : "+ result);
		return result;
	}

}
