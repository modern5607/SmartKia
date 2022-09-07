package egovframework.smart.tablet.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.smart.tablet.service.SmartTabletVO;


@Repository("SmartTabletDAO")
public class SmartTabletDAO extends EgovAbstractMapper {
    
	 @SuppressWarnings("unchecked")
	 public List<SmartTabletVO> selectList(SmartTabletVO vo) {
		
		 return (List<SmartTabletVO>) list("SmartTabletDAO.selectList", vo);
	} 
   
}
