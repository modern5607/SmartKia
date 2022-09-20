package egovframework.smart.rcpt.service.impl;


import java.util.HashMap;
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

    public List<Object> SelectMiddleLeadTime(String hcode) {
        return selectList("SmartRcptDAO.SelectMiddleLeadTime",hcode);
    }

    public Map<String, Object> InsertWebRcpt(Map<String, Object> map) {
        insert("SmartRcptDAO.InsertWebRcpt",map);
        Map<String, Object> resultmap = new HashMap<String,Object>();
        resultmap.put("takeseq", map.get("takeseq"));
        // System.out.println(map);
        return resultmap;
    }
    
    public List<Object> SelectRcptList(){
        return selectList("SelectRcptList");
    }

    public int InsertLeadRepair(Map<String, Object> leadrepairmap) {
        return insert("SmartRcptDAO.InsertLeadRepair",leadrepairmap);
    }
	 
}
