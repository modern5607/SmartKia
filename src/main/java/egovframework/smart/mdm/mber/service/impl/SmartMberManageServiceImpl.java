package egovframework.smart.mdm.mber.service.impl;

import java.util.List;

import egovframework.smart.mdm.mber.service.SmartMberManageService;
import egovframework.smart.mdm.mber.service.SmartMberManageVO;
import egovframework.smart.mdm.mber.service.UserDefaultVO;
import egovframework.let.sec.rgm.service.AuthorGroup;
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
@Service("smartMberManageService")
public class SmartMberManageServiceImpl extends EgovAbstractServiceImpl implements SmartMberManageService {

	/** mberManageDAO */
	@Resource(name="smartMberManageDAO")
	private SmartMberManageDAO smartMberManageDAO;

	/** egovUsrCnfrmIdGnrService */
	@Resource(name="egovUsrCnfrmIdGnrService")
	private EgovIdGnrService idgenService;


	@Override
	public int insertMber(SmartMberManageVO smartMberManageVO) throws Exception  {
		//고유아이디 셋팅
		String uniqId = idgenService.getNextStringId();
		smartMberManageVO.setUniqId(uniqId);
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(smartMberManageVO.getPassword(), smartMberManageVO.getMberId());
		smartMberManageVO.setPassword(pass);

		int result = smartMberManageDAO.insertMber(smartMberManageVO);
		return result;
	}


	@Override
	public SmartMberManageVO selectMber(String uniqId) {
		SmartMberManageVO smartMberManageVO = smartMberManageDAO.selectMber(uniqId);
		return smartMberManageVO;
	}


	@Override
	public List<SmartMberManageVO> selectMberList(UserDefaultVO userSearchVO) {
		return smartMberManageDAO.selectMberList(userSearchVO);
	}

 
    @Override
	public int selectMberListTotCnt(UserDefaultVO userSearchVO) {
    	return smartMberManageDAO.selectMberListTotCnt(userSearchVO);
    }
    
    @Override
    public int checkAuthorYn(SmartMberManageVO smartMberManageVO) throws Exception{
		return smartMberManageDAO.checkAuthorYn(smartMberManageVO);
		
	}
	@Override
	public int updateMber(SmartMberManageVO smartMberManageVO) throws Exception {
		//패스워드 암호화
		String pass = EgovFileScrty.encryptPassword(smartMberManageVO.getPassword(), smartMberManageVO.getMberId());
		smartMberManageVO.setPassword(pass);
		int result = smartMberManageDAO.updateMber(smartMberManageVO);
		System.out.println("result : "+result);
		return result;
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
				smartMberManageDAO.deleteMber(id[1]);
			}else if(id[0].equals("USR02")){
				//기업회원삭제
			}
		}
	}


	@Override
	public List<?> selectStplat(String stplatId)  {
        return smartMberManageDAO.selectStplat(stplatId);
	}


	@Override
	public void updatePassword(SmartMberManageVO smartMberManageVO) {
		smartMberManageDAO.updatePassword(smartMberManageVO);
	}


	@Override
	public SmartMberManageVO selectPassword(SmartMberManageVO passVO) {
		SmartMberManageVO smartMberManageVO = smartMberManageDAO.selectPassword(passVO);
		return smartMberManageVO;
	}


	@Override
	public int checkIdDplct(String checkId) {
		return smartMberManageDAO.checkIdDplct(checkId);
	}

	/**
	 * 그룹에 권한정보를 할당하여 데이터베이스에 등록
	 * @param authorGroup AuthorGroup
	 * @exception Exception
	 */
	@Override
	public void insertAuthor(SmartMberManageVO smartMberManageVO) throws Exception{
		smartMberManageDAO.insertAuthor(smartMberManageVO);
		
	}
	
	/**
	 * 화면에 조회된 그룹권한정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param authorGroup AuthorGroup
	 * @exception Exception
	 */
	@Override
	public void updateAuthor(SmartMberManageVO smartMberManageVO) throws Exception{
		smartMberManageDAO.updateAuthor(smartMberManageVO);
	}

	/**
	 * 그룹별 할당된 시스템 메뉴 접근권한을 삭제
	 * @param authorGroup AuthorGroup
	 * @exception Exception
	 */
	@Override
	public void deleteAuthor(SmartMberManageVO smartMberManageVO) throws Exception {
		smartMberManageDAO.deleteAuthor(smartMberManageVO);
	}
	
}