package egovframework.smart.customer.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.smart.customer.service.SmartCusMberManageService;
import egovframework.smart.customer.service.CusMberDefaultVO;
import egovframework.smart.customer.service.CusMberManageVO;
import egovframework.let.utl.sim.service.EgovFileScrty;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 일반회원관리에 관한비지니스클래스를 정의한다.
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
@Service("smartCusMberManageService")
public class CusMberManageServiceImpl extends EgovAbstractServiceImpl implements SmartCusMberManageService {

	/** cusMberManageDAO */
	@Resource(name="cusMberManageDAO")
	private CusMberManageDAO cusMberManageDAO;

	/** egovUsrCnfrmIdGnrService */
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;



	@Override
	public int insertMber(CusMberManageVO cusMberManageVO) throws Exception  {
		//고유아이디 셋팅
		String uniqId = idgenService.getNextStringId();
		cusMberManageVO.setUniqId(uniqId);
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(cusMberManageVO.getPassword(), cusMberManageVO.getMberId());
		cusMberManageVO.setPassword(pass);

		int result = cusMberManageDAO.insertMber(cusMberManageVO);
		return result;
	}

	@Override
	public CusMberManageVO selectMber(String uniqId) {
		CusMberManageVO cusMberManageVO = cusMberManageDAO.selectMber(uniqId);
		return cusMberManageVO;
	}


	@Override
	public Map<String,Object> selectMberList(CusMberManageVO cusmbermanageVO) {
		List<CusMberManageVO> result = cusMberManageDAO.selectMberList(cusmbermanageVO);
		
		Map<String,Object> map = new HashMap<String,Object>();
		int count = result.size();
		
		map.put("result", result);
		map.put("totCnt", count);
		return map;
	}

 
    @Override
	public int selectMberListTotCnt(CusMberDefaultVO userSearchVO) {
    	return cusMberManageDAO.selectMberListTotCnt(userSearchVO);
    }


	@Override
	public void updateMber(CusMberManageVO cusMberManageVO) throws Exception {
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(cusMberManageVO.getPassword(), cusMberManageVO.getMberId());
		cusMberManageVO.setPassword(pass);
		cusMberManageDAO.updateMber(cusMberManageVO);
	}


	@Override
	public void deleteMber(String checkedIdForDel)  {
		String [] delId = checkedIdForDel.split(",");
		for (int i=0; i<delId.length ; i++){
			String [] id = delId[i].split(":");
			if (id[0].equals("USR03")){
		        //업무사용자(직원)삭제
			}else if(id[0].equals("USR01")){
				//일반회원삭제
				cusMberManageDAO.deleteMber(id[1]);
			}else if(id[0].equals("USR02")){
				//기업회원삭제
			}
		}
	}


	@Override
	public List<?> selectStplat(String stplatId)  {
        return cusMberManageDAO.selectStplat(stplatId);
	}


	@Override
	public void updatePassword(CusMberManageVO cusMberManageVO) {
		cusMberManageDAO.updatePassword(cusMberManageVO);
	}


	@Override
	public CusMberManageVO selectPassword(CusMberManageVO passVO) {
		CusMberManageVO cusMberManageVO = cusMberManageDAO.selectPassword(passVO);
		return cusMberManageVO;
	}


	@Override
	public int checkIdDplct(String checkId) {
		return cusMberManageDAO.checkIdDplct(checkId);
	}


}