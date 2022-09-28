package egovframework.smart.rcpt.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.smart.customer.service.CusMberManageVO;


public interface SmartRcptService {

    List<?> selectCarInfo(SmartRcptVO vo) throws Exception;

    List<Object> SelectMiddleLeadTime(String s)throws Exception;
    int InsertWebRcpt(Map<String,Object> map)throws Exception;
    List<Object> SelectRcptList(SmartRcptVO smartrcptVO) throws Exception ;
    List<Object> SelectRcptinfo(String seq) throws Exception ;

    int InsertLeadRepair(Map<String, Object> leadrepairmap)throws Exception;

    List<Object> selectRcptRepairInfo(String seq)throws Exception;

    int UpdateRepair(Map<String, Object> params)throws Exception;

    int InsertMber(Map<String, Object> params)throws Exception;

    HashMap<String,Object> selectMberList(Map<String, Object> params)throws Exception;

}