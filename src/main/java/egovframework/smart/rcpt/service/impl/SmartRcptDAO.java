package egovframework.smart.rcpt.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.smart.customer.service.CusMberManageVO;
import egovframework.smart.rcpt.service.ReservationVO;
import egovframework.smart.rcpt.service.SmartRcptVO;


@Repository("SmartRcptDAO")
public class SmartRcptDAO extends EgovAbstractMapper {

    public List<Object> selectCarInfo(SmartRcptVO vo) {
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

    public int insertMber(CusMberManageVO mbervo) {
        return insert("SmartRcptDAO.InsertMber",mbervo);
    }

    public HashMap<String,Object> selectMberList(Map<String, Object> params) {
        return selectOne("SmartRcptDAO.SelectMber",params);
    }

    public List<ReservationVO> searchReservation(ReservationVO searchVO) {
        return selectList("SmartRcptDAO.searchReservation",searchVO);
    }

    public List<Object> SelectReservationRcptList() {
        return selectList("SelectReservationRcptList");
    }

    public List<Object> Selectrcptinfo_params(Map<String, Object> params) {
        return selectList("SmartRcptDAO.Selectrcptinfo_params",params);
    }

    public Map<String, Object> InsertWebReservationRcpt(Map<String, Object> map) {
        insert("SmartRcptDAO.InsertWebReservationRcpt",map);
        Map<String, Object> resultmap = new HashMap<String,Object>();
        resultmap.put("takeseq", map.get("takeseq"));
        // System.out.println(map);
        return resultmap;
    }

    public int CancelWebRcpt(String takeseq) {
        return update("SmartRcptDAO.CancelWebRcpt",takeseq);
    }

    public int CancelWebReservationRcpt(String takeseq) {
        return update("SmartRcptDAO.CancelWebReservationRcpt",takeseq);
    }

    public List<Object> selectReserveCarInfo(SmartRcptVO smartrcotVO) {
        return selectList("SmartRcptDAO.selectreserveCarInfo",smartrcotVO);
    }
	 
}
