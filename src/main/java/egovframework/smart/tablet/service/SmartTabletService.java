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

	int updatestatus(Map<String, Object> params);
	
}