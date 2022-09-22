package egovframework.smart.tablet.service.impl;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.smart.tablet.service.SmartTabletVO;


@Repository("SmartTabletDAO")
public class SmartTabletDAO extends EgovAbstractMapper {
    
	 @SuppressWarnings("unchecked")
	 public List<SmartTabletVO> selectList(SmartTabletVO vo) {
		
		 return (List<SmartTabletVO>) list("SmartTabletDAO.selectList", vo);
	} 
	 
	 @SuppressWarnings("unchecked")
	 public List<SmartTabletVO> assignmentList(SmartTabletVO vo) {
		
		 return (List<SmartTabletVO>) list("SmartTabletDAO.assignmentList", vo);
	} 

	@SuppressWarnings("unchecked")
	public int updateassign(SmartTabletVO vo) {
	
		return update("SmartTabletDAO.UpdateAssign",vo);
   } 
	
	@SuppressWarnings("unchecked")
	 public Map<String,Object> checkstatus(Map<String, Object> params) {
		
		 return  selectOne("SmartTabletDAO.checkstatus", params);
	}

	public int updatestatus(Map<String, Object> params) {
		return update("SmartTabletDAO.updatestatus",params);
	}

	public List<SmartTabletVO> receiveList(SmartTabletVO searchVO) {
		return (List<SmartTabletVO>) list("SmartTabletDAO.receiveList", searchVO);
	}

	public int Transfergroup(Map<String, Object> params) {

		return update("SmartTabletDAO.Transfergroup",params);
	}

	@SuppressWarnings("unchecked")
	public int insertlog(Map<String, Object> params) {
		return insert("SmartTabletDAO.insertlog",params);
	} 
   
}
