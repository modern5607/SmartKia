package egovframework.smart.crm.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.smart.crm.service.SmartCrmVO;
import egovframework.smart.mdm.mber.service.SmartMberManageVO;
import egovframework.smart.mdm.mber.service.UserDefaultVO;
import egovframework.smart.mdm.service.SmartLeadTimeVO;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;

import org.springframework.stereotype.Repository;

/**
 * 일반회원관리에 관한 데이터 접근 클래스를 정의한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  JJY            최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */
@Repository("smartCrmDAO")
public class SmartCrmDAO extends EgovAbstractMapper{

    @SuppressWarnings("unchecked")
	public List<SmartCrmVO> selectCrmList(SmartCrmVO vo) throws Exception{
        return (List<SmartCrmVO>) list("smartCrmDAO.selectCrmList", vo);
    }    
    @SuppressWarnings("unchecked")
    public List<SmartCrmVO> dailyrepair(SmartCrmVO vo) {
        return selectList("smartCrmDAO.dailyrepair");
    }
    @SuppressWarnings("unchecked")
    public List<SmartCrmVO> dailyhead(SmartCrmVO vo) {
        return selectList("smartCrmDAO.dailyhead",vo);
    }
    @SuppressWarnings("unchecked")
    public List<SmartCrmVO> dailydetail(SmartCrmVO vo) {
        return selectList("smartCrmDAO.dailydetail",vo);
    }
    
    @SuppressWarnings("unchecked")
    public List<SmartCrmVO> selectLeadTime(SmartCrmVO vo) {
        return selectList("smartCrmDAO.selectLeadTime");
    }
    @SuppressWarnings("unchecked")
    public List<SmartCrmVO> selectLeadMain(SmartCrmVO vo) {
        return selectList("smartCrmDAO.selectLeadMain");
    }
    @SuppressWarnings("unchecked")
    public List<SmartCrmVO> selectLeadMiddle(SmartCrmVO vo) {
        return selectList("smartCrmDAO.selectLeadMiddle",vo);
    }
    public List<Object> selectLeadTimelist(Map<String, Object> params) {
        return selectList("SmartMdmDAO.selectLeadTimelist",params);
    }
}