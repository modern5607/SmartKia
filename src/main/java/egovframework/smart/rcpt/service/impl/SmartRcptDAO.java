package egovframework.smart.rcpt.service.impl;


import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.smart.rcpt.service.SmartRcptVO;


@Repository("SmartRcptDAO")
public class SmartRcptDAO extends EgovAbstractMapper {

    public List<?> selectCarInfo(SmartRcptVO vo) {
        return selectList("SmartRcptDAO.selectCarInfo",vo);
    }
    
	 
}
