package egovframework.smart.mdm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.smart.rcpt.service.SmartRcptVO;


public interface SmartMdmService {
	
public Map<String, Object> selectCommonCodeList(SmartCommonCodeVO vo) throws Exception;
	
	public Map<String,Object> SelectCommonGroupCode(SmartCommonCodeVO vo) throws Exception;
	
	public int InsertCommonGroupCode(SmartCommonCodeVO vo) throws Exception;

	public int InsertCommonCode(SmartCommonCodeVO vo) throws Exception;

	public int UpdateCommonGroupCode(SmartCommonCodeVO comCodeVO) throws Exception;

    public Map<String, Object> SelectCommonCode(SmartCommonCodeVO comCodeVO) throws Exception;
	
    public int UpdateCommonCode(SmartCommonCodeVO comCodeVO) throws Exception;

	public Map<String,Object> selectLeadTime(SmartLeadTimeVO leadtimeVO)throws Exception;

	public int UpdateLeadTime(SmartLeadTimeVO leadtimeVO)throws Exception;

	public Map<String, Object> selectBizList(SmartMdmBizVO vo)
			throws Exception;

	public int insertaddBiz(SmartMdmBizVO vo) throws Exception;

	public int checkCustid(String checkId) throws Exception;
	
	public Map<String, Object> SelectCommonCustid(SmartMdmBizVO SmartMdmBizVO) throws Exception;
	
	public int UpdateBiz(SmartMdmBizVO SmartMdmBizVO) throws Exception;
	

	public int InsertLeadTime(SmartLeadTimeVO leadtimeVO) throws Exception;

	public List<Object> SelectCmmCode(String GroupCode) throws Exception;

	public List<Object> SelectCode(String groupcode,String code) throws Exception;

	public Map<String, Object> selectLeadTime2()throws Exception;


}