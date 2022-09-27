package egovframework.smart.tablet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;


public interface SmartTabletService {
	
	public Map<String, Object> selectList(SmartTabletVO vo) throws Exception;
	
	public Map<String, Object> assignmentList(SmartTabletVO vo) throws Exception;
	
	public int updateAssign(SmartTabletVO vo)throws Exception;

	public Map<String,Object> checkstatus(Map<String, Object> params);

	public int updatestatus(Map<String, Object> params);

	public Map<String, Object> receiveList(SmartTabletVO searchVO);

	public int Transfergroup(Map<String, Object> params);

	public int insertlog(Map<String, Object> params)throws Exception;
	
	public Map<String, Object> detailList(SmartTabletVO vo);

	public List<Object> selectlogininfo(SmartTabletVO searchVO);

	public List<Object> selectcarlist(String seq);



	
	
}