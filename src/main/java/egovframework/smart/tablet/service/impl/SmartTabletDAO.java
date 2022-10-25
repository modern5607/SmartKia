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
   
	public int updatestatus(Map<String, Object> params) {
		return update("SmartTabletDAO.updatestatus",params);
	}

	public List<SmartTabletVO> detailList(SmartTabletVO vo) {
		
		return (List<SmartTabletVO>) list("SmartTabletDAO.detailList", vo);
	}

	public List<Object> selectlogininfo(SmartTabletVO searchVO) {
	
		return selectList("SmartTabletDAO.selectlogininfo", searchVO);
	}

	public List<Object> selectcarlist(String seq) {
		return selectList("SmartTabletDAO.selectcarlist", seq);
	}

	public int UpdateAssign(Map<String, Object> params) {
		return update("SmartTabletDAO.UpdateAssign",params);
	}

	public int cancelreceive(Map<String, Object> params) {
		 return update("SmartTabletDAO.cancelreceive",params);
	}

    public int RepairComplete(Map<String, Object> params) {
        return update("SmartTabletDAO.RepairComplete",params);
    }

    public int updatekilro(Map<String, Object> params) {
		return update("SmartTabletDAO.updatekilro",params);
    }

    public int ReleaseRepair(Map<String, Object> params) {
        return update("SmartTabletDAO.ReleaseRepair",params);
    }

    public List<Object> reservelist() {
        return selectList("SmartTabletDAO.reservelist");
    }

    public int CallGuest(Map<String, Object> params) {
        return update("SmartTabletDAO.CallGuest",params);
    }
   
}
