package egovframework.smart.mdm.mber.service.impl;

import java.util.List;

import egovframework.let.sec.rgm.service.AuthorGroup;
import egovframework.smart.mdm.mber.service.SmartMberManageVO;
import egovframework.smart.mdm.mber.service.UserDefaultVO;

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
@Repository("smartMberManageDAO")
public class SmartMberManageDAO extends EgovAbstractMapper{

    /**
     * 기 등록된 특정 일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
     * @param userSearchVO 검색조건
     * @return List<MberManageVO> 기업회원 목록정보
     */
    @SuppressWarnings("unchecked")
	public List<SmartMberManageVO> selectMberList(UserDefaultVO userSearchVO){
        return (List<SmartMberManageVO>) list("smartMberManageDAO.selectMberList", userSearchVO);
    }

    /**
     * 일반회원 총 갯수를 조회한다.
     * @param userSearchVO 검색조건
     * @return int 일반회원총갯수
     */
    public int selectMberListTotCnt(UserDefaultVO userSearchVO) {
        return (Integer)selectOne("smartMberManageDAO.selectMberListTotCnt", userSearchVO);
    }

    /**
     * 화면에 조회된 일반회원의 정보를 데이터베이스에서 삭제
     * @param delId 삭제 대상 일반회원아이디
     */
    public void deleteMber(String delId){
        delete("smartMberManageDAO.deleteMber_S", delId);
    }

    /**
     * 일반회원의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
     * @param mberManageVO 일반회원 등록정보
     * @return String 등록결과
     */
    public int insertMber(SmartMberManageVO smartMberManageVO){
        return insert("smartMberManageDAO.insertMber_S", smartMberManageVO);
    }

    /**
     * 기 등록된 사용자 중 검색조건에 맞는일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
     * @param mberId 상세조회대상 일반회원아이디
     * @return MberManageVO 일반회원 상세정보
     */
    public SmartMberManageVO selectMber(String mberId){
        return (SmartMberManageVO) selectOne("smartMberManageDAO.selectMber_S", mberId);
    }

    /**
     * 화면에 조회된일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
     * @param mberManageVO 일반회원수정정보
     * @return 
     */
    public int updateMber(SmartMberManageVO smartMberManageVO){
        return update("smartMberManageDAO.updateMber_S",smartMberManageVO);
    }

    /**
     * 일반회원 약관확인
     * @param stplatId 일반회원약관아이디
     * @return List 일반회원약관정보
     */
	public List<?> selectStplat(String stplatId){
    	return list("smartMberManageDAO.selectStplat_S", stplatId);
    }

    /**
     * 일반회원 암호수정
     * @param passVO 기업회원수정정보(비밀번호)
     */
    public void updatePassword(SmartMberManageVO passVO) {
        update("smartMberManageDAO.updatePassword_S", passVO);
    }

    /**
     * 일반회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
     * @param mberManageVO 일반회원암호 조회조건정보
     * @return MberManageVO 일반회원 암호정보
     */
    public SmartMberManageVO selectPassword(SmartMberManageVO smartMberManageVO){
    	return (SmartMberManageVO) selectOne("smartMberManageDAO.selectPassword_S", smartMberManageVO);
    }

    /**
     * 입력한 사용자아이디의 중복여부를 체크하여 사용가능여부를 확인
     * @param checkId 중복체크대상 아이디
     * @return int 사용가능여부(아이디 사용회수 )
     */
    public int checkIdDplct(String checkId){
        return (Integer)selectOne("smartMberManageDAO.checkIdDplct_S", checkId);
    }
	/**
	 * 그룹에 권한정보를 할당하여 데이터베이스에 등록
	 * @param authorGroup AuthorGroup
	 * @exception Exception
	 */
	public int checkAuthorYn(SmartMberManageVO smartMberManageVO) throws Exception {
		 return (Integer) selectOne("smartMberManageDAO.checkAuthorYn", smartMberManageVO);
	}
	public void insertAuthor(SmartMberManageVO smartMberManageVO) throws Exception {
		insert("smartMberManageDAO.insertAuthor", smartMberManageVO);
	}

	/**
	 * 화면에 조회된 그룹권한정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param authorGroup AuthorGroup
	 * @exception Exception
	 */
	public void updateAuthor(SmartMberManageVO smartMberManageVO) throws Exception {
		update("smartMberManageDAO.updateAuthor", smartMberManageVO);
	}

	/**
	 * 그룹별 할당된 시스템 메뉴 접근권한을 삭제
	 * @param authorGroup AuthorGroup
	 * @exception Exception
	 */
	public void deleteAuthor(SmartMberManageVO smartMberManageVO) throws Exception {
		delete("smartMberManageDAO.deleteAuthor", smartMberManageVO);
	}
}