package egovframework.smart.mdm.service;

import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;


public interface SmartMdmService {
	
	public Map<String, Object> selectCommonCodeList(ComDefaultVO vo)
			throws Exception;

	public Map<String, Object> selectBizList(SmartMdmBizVO vo)
			throws Exception;

	public int insertaddBiz(SmartMdmBizVO vo) throws Exception;

	public int checkCustid(String checkId) throws Exception;

}