package egovframework.smart.mdm.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.uss.olh.qna.service.QnaManageVO;
import egovframework.smart.mdm.service.SmartCommonCodeVO;
import egovframework.smart.mdm.service.SmartLeadTimeVO;
import egovframework.smart.mdm.service.SmartMdmBizVO;

@Repository("SmartMdmDAO")
public class SmartMdmDAO extends EgovAbstractMapper {
    
	 
    @SuppressWarnings("unchecked")
    public List<SmartCommonCodeVO> selectCommonCodeList(SmartCommonCodeVO vo) throws Exception
    {
        return (List<SmartCommonCodeVO>) list("SmartMdmDAO.selectCommonCodeList", vo);
    }
    @SuppressWarnings("unchecked")
    public List<SmartCommonCodeVO> selectCommonCodeDetail(SmartCommonCodeVO vo) throws Exception{
        return (List<SmartCommonCodeVO>) list("SmartMdmDAO.selectCommonCodeDetail", vo);
    }
    @SuppressWarnings("unchecked")
	public List<SmartCommonCodeVO> selectCommonGroupCode(SmartCommonCodeVO vo) throws Exception{
    	return (List<SmartCommonCodeVO>)list("SmartMdmDAO.selectCommonGroupCode", vo);
    }
	public int insertCommonGroupCode(SmartCommonCodeVO vo) {
		return insert("SmartMdmDAO.insertCommonGroupCode", vo);
	}
	@SuppressWarnings("unchecked")
	public List<SmartCommonCodeVO> selectCommonCode(SmartCommonCodeVO vo) {	
		return (List<SmartCommonCodeVO>)list("SmartMdmDAO.selectCommonCode",vo);
	}
	public int insertCommonCode(SmartCommonCodeVO vo) {
		return insert("SmartMdmDAO.insertCommonCode", vo);
	}
	public int updateCommonGroupCode(SmartCommonCodeVO vo) {
		return update("SmartMdmDAO.updateCommonGroupCode", vo);

	}
	@SuppressWarnings("unchecked")
	public List<SmartLeadTimeVO> selectLeadTime(SmartLeadTimeVO vo) {
		return selectList("SmartMdmDAO.selectLeadTime");
	}
	@SuppressWarnings("unchecked")
	public List<SmartLeadTimeVO> selectLeadMain(SmartLeadTimeVO vo) {
		return selectList("SmartMdmDAO.selectLeadMain");
	}
	@SuppressWarnings("unchecked")
    public List<SmartLeadTimeVO> selectLeadMiddle(SmartLeadTimeVO vo) {
		return selectList("SmartMdmDAO.selectLeadMiddle",vo);
    }
	@SuppressWarnings("unchecked")
    public List<SmartLeadTimeVO> selectLeadSub(SmartLeadTimeVO vo) {
		return selectList("SmartMdmDAO.selectLeadSub",vo);
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
	
	@SuppressWarnings("unchecked")
	public List<SmartMdmBizVO> selectCommonCustid(SmartMdmBizVO vo) {
		return (List<SmartMdmBizVO>)list("SmartMdmDAO.selectCommonCustid", vo);
	}
	public int UpdateBiz(SmartMdmBizVO vo) {
		System.out.println("asd: "+vo);
		return update("SmartMdmDAO.UpdateBiz", vo);

	}

}
