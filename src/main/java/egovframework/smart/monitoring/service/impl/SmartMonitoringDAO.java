package egovframework.smart.monitoring.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.ComDefaultVO;

@Repository("SmartMonitoringDAO")
public class SmartMonitoringDAO extends EgovAbstractMapper {
    
    @SuppressWarnings("unchecked")
    public List<ComDefaultVO> selectMonitoringList(ComDefaultVO vo) throws Exception
    {
        return (List<ComDefaultVO>) list("SmartMonitoringDAO.selectMonitoringList", vo);
    }
}
