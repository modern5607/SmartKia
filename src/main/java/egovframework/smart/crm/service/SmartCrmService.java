package egovframework.smart.crm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.smart.mdm.mber.service.SmartMberManageVO;
import egovframework.smart.mdm.mber.service.UserDefaultVO;
import egovframework.smart.mdm.service.SmartLeadTimeVO;


public interface SmartCrmService {

	public  Map<String, Object> selectCrmList(SmartCrmVO vo) throws Exception;
	
	public int selectCrmListTotCnt(SmartCrmVO vo) throws Exception;

    public  Map<String, Object> dailyrepair(SmartCrmVO vo) throws Exception;
    
    public Map<String,Object> selectLeadTime(SmartCrmVO vo)throws Exception;

    public List<Object> selectLeadTimelist(Map<String, Object> params)throws Exception;

}