package egovframework.smart.monitoring.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.smart.monitoring.service.SmartMonitoringVO;

@Repository("SmartMonitoringDAO")
public class SmartMonitoringDAO extends EgovAbstractMapper {
    
    public List<Object> selectMonitoringList() throws Exception
    {
        return selectList("SmartMonitoringDAO.selectMonitoringList");
    }

    public List<Object> SceneMonitoring(String Team) {
        return selectList("SmartMonitoringDAO.SceneMonitoring", Team);
    }

    public List<Object> GuestMonitoring() {
        return selectList("SmartMonitoringDAO.GuestMonitoring");
    }

    public List<Object> CompleteMonitoring() {
        return selectList("SmartMonitoringDAO.CompleteMonitoring");
    }

    public List<Object> repairMonitoring() {
        return selectList("SmartMonitoringDAO.repairMonitoring");
    }

}
