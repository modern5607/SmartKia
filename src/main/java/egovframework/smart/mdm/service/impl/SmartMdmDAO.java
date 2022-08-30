package egovframework.smart.mdm.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.uss.olh.qna.service.QnaManageVO;
import egovframework.smart.mdm.service.SmartMdmBizVO;

@Repository("SmartMdmDAO")
public class SmartMdmDAO extends EgovAbstractMapper {
    
    @SuppressWarnings("unchecked")
    public List<ComDefaultVO> selectCommonCodeList(ComDefaultVO vo) throws Exception
    {
        return (List<ComDefaultVO>) list("SmartMdmDAO.selectCommonCodeList", vo);
    }

    @SuppressWarnings("unchecked")
    public List<SmartMdmBizVO> selectBizList(SmartMdmBizVO vo) throws Exception
    {
        return (List<SmartMdmBizVO>) list("SmartMdmDAO.selectBizList", vo);
    }
    
    public int insertaddBiz(SmartMdmBizVO vo) throws Exception {

        int result = insert("SmartMdmDAO.insertaddBiz", vo);
        System.out.println(result);
        return result;
    }

	public int checkCustid(String checkId) throws Exception {
		return (Integer)selectOne("SmartMdmDAO.checkCustid", checkId);
	}
}
