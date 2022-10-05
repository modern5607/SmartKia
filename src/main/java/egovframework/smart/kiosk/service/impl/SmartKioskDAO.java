package egovframework.smart.kiosk.service.impl;


import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;


@Repository("SmartKioskDAO")
public class SmartKioskDAO extends EgovAbstractMapper {

    public List<Object> selectCarRepairInfo(String id) {
       return selectList("SmartKioskDAO.selectCarRepairInfo",id);
    }

    public List<Object> selectCarRepairDetailInfo(String seq){
        return selectList("SmartKioskDAO.selectCarRepairDetailInfo",seq);
    }

}
