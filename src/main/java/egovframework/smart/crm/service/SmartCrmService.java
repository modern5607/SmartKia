package egovframework.smart.crm.service;

import java.util.List;
import java.util.Map;

import egovframework.smart.mdm.mber.service.SmartMberManageVO;
import egovframework.smart.mdm.mber.service.UserDefaultVO;


public interface SmartCrmService {

	public  Map<String, Object> selectCrmList(SmartCrmVO vo) throws Exception;
	
	public int selectCrmListTotCnt(SmartCrmVO vo) throws Exception;

}