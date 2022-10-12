package egovframework.let.sym.ccm.zip.service.impl;

import java.util.List;

import egovframework.let.sym.ccm.zip.service.SmartZip;
import egovframework.let.sym.ccm.zip.service.Zip;
import egovframework.let.sym.ccm.zip.service.ZipVO;

import org.egovframe.rte.psl.dataaccess.EgovAbstractMapper;

import org.springframework.stereotype.Repository;

/**
 *
 * 우편번호에 대한 데이터 접근 클래스를 정의한다
 * @author 공통서비스 개발팀 이중호
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  이중호          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */
@Repository("ZipManageDAO")
public class ZipManageDAO extends EgovAbstractMapper {

	/**
	 * 우편번호를 삭제한다.
	 * @param zip
	 * @throws Exception
	 */
	public void deleteZip(SmartZip smartZip) throws Exception {
		delete("ZipManageDAO.deleteZip", smartZip);
	}

	/**
	 * 우편번호 전체를 삭제한다.
	 * @throws Exception
	 */
	public void deleteAllZip() throws Exception {
		delete("ZipManageDAO.deleteAllZip", new Object());
	}

	/**
	 * 우편번호를 등록한다.
	 * @param zip
	 * @throws Exception
	 */
	public void insertZip(SmartZip smartZip) throws Exception {
        insert("ZipManageDAO.insertZip", smartZip);
	}

	/**
	 * 우편번호 엑셀파일을 등록한다.
	 * @param zip
	 * @throws Exception
	 */
	public void insertExcelZip() throws Exception {
		delete("ZipManageDAO.deleteAllZip", new Object());
	}


	/**
	 * 우편번호 상세항목을 조회한다.
	 * @param zip
	 * @return Zip(우편번호)
	 */
	public SmartZip selectZipDetail(SmartZip smartZip) throws Exception {
		return (SmartZip) selectOne("ZipManageDAO.selectZipDetail", smartZip);
	}


    /**
	 * 우편번호 목록을 조회한다.
     * @param searchVO
     * @return List(우편번호 목록)
     * @throws Exception
     */
    public List<?> selectZipList(ZipVO searchVO) throws Exception {
        return list("ZipManageDAO.selectZipList", searchVO);
    }

    /**
	 * 우편번호 총 갯수를 조회한다.
     * @param searchVO
     * @return int(우편번호 총 갯수)
     */
    public int selectZipListTotCnt(ZipVO searchVO) throws Exception {
        return (Integer)selectOne("ZipManageDAO.selectZipListTotCnt", searchVO);
    }

	/**
	 * 우편번호를 수정한다.
	 * @param zip
	 * @throws Exception
	 */
	public void updateZip(SmartZip smartZip) throws Exception {
		update("ZipManageDAO.updateZip", smartZip);
	}

	public List<Object> selectSIDO() {
		return selectList("ZipManageDAO.selectSIDO");
	}

	public List<Object> SelectMiddleAdress(String sido) {
		return selectList("ZipManageDAO.SelectMiddleAdress",sido);
	}

}
