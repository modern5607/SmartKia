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
    @SuppressWarnings("unchecked")

    public List<Object> SelectRcptList(SmartRcptVO smartrcptVO){
        return selectList("SelectRcptList",smartrcptVO);
    }

    public int InsertLeadRepair(Map<String, Object> leadrepairmap) {
        return insert("SmartRcptDAO.InsertLeadRepair",leadrepairmap);
    }

    public List<Object> selectRcptRepairInfo(String seq) {
        return selectList("SmartRcptDAO.selectRcptRepairInfo",seq);
    }

    public List<Object> SelectRcptinfo(String seq) {
        return selectList("SmartRcptDAO.SelectRcptinfo",seq);
    }

    public List<Object> selectRepairInfo(Map<String, Object> params) {
        return selectOne("SmartRcptDAO.SelectRepairinfo",params);
    }

    public int UpdateRcpt(Map<String, Object> params) {
        return update("SmartRcptDAO.UpdateRcpt",params);
    }

    public int UpdateRepair(Map<String, Object> params) {
        return update("SmartRcptDAO.UpdateRepair",params);
    }

    public int DeleteRepair(Map<String, Object> params) {
        return delete("SmartRcptDAO.DeleteRepair",params);
    }
	 
}
