package egovframework.smart.tablet.service;

import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;


public interface SmartTabletService {
	
	public Map<String, Object> selectList(SmartTabletVO vo) throws Exception;
}