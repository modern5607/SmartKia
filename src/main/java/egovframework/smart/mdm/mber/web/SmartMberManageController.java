package egovframework.smart.mdm.mber.web;

import java.io.PrintWriter;
/*import java.io.PrintWriter;*/
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.smart.mdm.mber.service.SmartMberManageService;
import egovframework.smart.mdm.mber.service.SmartMberManageVO;
import egovframework.smart.mdm.mber.service.UserDefaultVO;
import egovframework.smart.mdm.service.SmartCommonCodeVO;
import egovframework.smart.mdm.service.SmartMdmBizVO;
import egovframework.smart.mdm.service.SmartMdmService;
import egovframework.let.utl.sim.service.EgovFileScrty;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * 일반회원관련 요청을  비지니스 클래스로 전달하고 처리된결과를  해당   웹 화면으로 전달하는  Controller를 정의한다
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
 *   2009.04.10  조재영          최초 생성
 *
 * </pre>
 */
@Controller
public class SmartMberManageController {

	/** mberManageService */
	@Resource(name = "smartMberManageService")
	private SmartMberManageService smartMberManageService;

	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;
	
	@Resource(name = "SmartMdmService")
	private SmartMdmService smartmdmservice;

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;

	
	
	/**
	 * 일반회원목록을 조회한다. (pageing)
	 * @param userSearchVO 검색조건정보
	 * @param model 화면모델
	 * @return cmm/uss/umt/EgovMberManage
	 * @throws Exception
	 */
	

	@RequestMapping(value = "/mdm/SmartMberManage.do")
	public String selectMberManage(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, ModelMap model, HttpServletRequest request,
			@RequestParam(value = "menuNo", required = false) String menuNo
			) throws Exception {

		// 선택된 메뉴정보를 세션으로 등록한다.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "uat/uia/EgovLoginUsr";
    	}
    	
		/** EgovPropertyService */
		userSearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		userSearchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(userSearchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(userSearchVO.getPageUnit());
		paginationInfo.setPageSize(userSearchVO.getPageSize());

		userSearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		userSearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		userSearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("resultList", smartMberManageService.selectMberList(userSearchVO));

		int totCnt = smartMberManageService.selectMberListTotCnt(userSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		//일반회원 상태코드를 코드정보로부터 조회
		ComDefaultCodeVO vo = new ComDefaultCodeVO();
		vo.setCodeId("COM013");
		model.addAttribute("entrprsMberSttus_result", cmmUseService.selectCmmCodeDetail(vo));
		System.out.println(userSearchVO);

    	System.out.println(smartMberManageService.selectMberList(userSearchVO));
		
		return "/mdm/mber/SmartMberManage";
	}
	
	
	
	@RequestMapping("/mdm/SmartMberInsertView.do")
	public String insertMberView(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, @ModelAttribute("smartMberManageVO") SmartMberManageVO smartMberManageVO, Model model)
			throws Exception {

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "uat/uia/EgovLoginUsr";
    	}
    	
    	SmartCommonCodeVO vo = new SmartCommonCodeVO();
    	vo.setGroupcode("AUTO_ROOM");
    	System.out.println(vo);
    	Map<String,Object> map =  smartmdmservice.SelectCommonCode(vo);

    	model.addAttribute("team",map.get("info"));
    	System.out.println("map : "+map.get("info"));
//    	SmartMberManageVO vo1 = new SmartMberManageVO(); 
		
//		System.out.println(userSearchVO);
//
//    	System.out.println(smartMberManageService.selectMberList(userSearchVO));

		return "mdm/mber/SmartMberInsert";
	}

	

@RequestMapping(value = "/mdm/SmartMberInsert.do") public void
	insertMber(@ModelAttribute("smartMberManageVO") SmartMberManageVO
	  smartMberManageVO, BindingResult bindingResult, ModelMap model,
	  HttpServletResponse response) throws Exception {
	  response.setContentType("text/html; charset=euc-kr");
	  PrintWriter out = response.getWriter();
	  
	  int result = smartMberManageService.insertMber(smartMberManageVO); 		
	  if (result == 0) // insert실패
		{
			out.println("<script>");
			out.println("alert('등록에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('성공적으로 등록되었습니다.')");
			out.println("location.href='/mdm/SmartMberManage.do'");
			out.println("</script>");
		}
	}


@RequestMapping("/mdm/SmartMberSelectUpdtView.do")
public String updateMberView(@RequestParam("selectedId") String mberId, @ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, Model model) throws Exception {

	// 미인증 사용자에 대한 보안처리
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	if(!isAuthenticated) {
		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	return "uat/uia/EgovLoginUsr";
	}

	SmartCommonCodeVO vo = new SmartCommonCodeVO();
	vo.setGroupcode("AUTO_ROOM");
	System.out.println(vo);
	Map<String,Object> map =  smartmdmservice.SelectCommonCode(vo);
	
	SmartMberManageVO smartMberManageVO = smartMberManageService.selectMber(mberId);
	model.addAttribute("smartMberManageVO", smartMberManageVO);
	model.addAttribute("userSearchVO", userSearchVO);
	model.addAttribute("team",map.get("info"));

	return "mdm/mber/SmartMberSelectUpdt";
}


@RequestMapping("/mdm/SmartMberSelectUpdt.do")
public void updateMber(@ModelAttribute("smartMberManageVO") SmartMberManageVO smartMberManageVO, BindingResult bindingResult, ModelMap model,HttpServletResponse response) throws Exception {
	response.setContentType("text/html; charset=euc-kr");
	PrintWriter out = response.getWriter();
	System.out.println(smartMberManageVO);
	
	int result = smartMberManageService.updateMber(smartMberManageVO);
	
	if (result == 0) //실패
	{
		out.println("<script>");
		out.println("alert('이미 존재하는 사용자입니다.')");
		out.println("history.back()");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('성공적으로 수정되었습니다.')");
		out.println("location.href='/mdm/SmartMberManage.do'");
		out.println("</script>");
	}
}
/**
 * 일반회원정보삭제후 목록조회 화면으로 이동한다.
 * @param checkedIdForDel 삭제대상 아이디 정보
 * @param userSearchVO 검색조건정보
 * @param model 화면모델
 * @return forward:/uss/umt/mber/EgovMberManage.do
 * @throws Exception
 */
@RequestMapping("/mdm/SmartMberDelete.do")
public String deleteMber(@RequestParam("checkedIdForDel") String checkedIdForDel, @ModelAttribute("searchVO") UserDefaultVO userSearchVO, Model model) throws Exception {

	// 미인증 사용자에 대한 보안처리
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	if(!isAuthenticated) {
		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	return "uat/uia/EgovLoginUsr";
	}

	smartMberManageService.deleteMber(checkedIdForDel);
	//Exception 없이 진행시 삭제성공메시지
	model.addAttribute("resultMsg", "success.common.delete");
	return "forward:/mdm/SmartMberManage.do";
}

/**
 * 일반회원가입신청 등록화면으로 이동한다.
 * @param userSearchVO 검색조건
 * @param mberManageVO 일반회원가입신청정보
 * @param commandMap 파라메터전달용 commandMap
 * @param model 화면모델
 * @return cmm/uss/umt/EgovMberSbscrb
 * @throws Exception
 */
@RequestMapping("/mdm/SmartMberSbscrbView.do")
public String sbscrbMberView(@ModelAttribute("userSearchVO") UserDefaultVO userSearchVO, @ModelAttribute("smartMberManageVO") SmartMberManageVO smartMberManageVO,
		@RequestParam Map<String, Object> commandMap, Model model) throws Exception {

	// 미인증 사용자에 대한 보안처리
	/*
	 * Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	 * if(!isAuthenticated) { model.addAttribute("message",
	 * egovMessageSource.getMessage("fail.common.login")); return
	 * "uat/uia/EgovLoginUsr"; }
	 */
	ComDefaultCodeVO vo = new ComDefaultCodeVO();

	//패스워드힌트목록을 코드정보로부터 조회
	vo.setCodeId("COM022");
	model.addAttribute("passwordHint_result", cmmUseService.selectCmmCodeDetail(vo));

	//성별구분코드를 코드정보로부터 조회
	vo.setCodeId("COM014");
	model.addAttribute("sexdstnCode_result", cmmUseService.selectCmmCodeDetail(vo));

	if (!"".equals(commandMap.get("realname"))) {
		model.addAttribute("mberNm", commandMap.get("realname")); //실명인증된 이름 - 주민번호 인증
		model.addAttribute("ihidnum", commandMap.get("ihidnum")); //실명인증된 주민등록번호 - 주민번호 인증
	}
	if (!"".equals(commandMap.get("realName"))) {
		model.addAttribute("mberNm", commandMap.get("realName")); //실명인증된 이름 - ipin인증
	}

	smartMberManageVO.setGroupId("DEFAULT");
	smartMberManageVO.setMberSttus("DEFAULT");

	return "mdm/mber/SmartMberSbscrb";
}

/**
 * 일반회원가입신청등록처리후로그인화면으로 이동한다.
 * @param mberManageVO 일반회원가입신청정보
 * @return forward:/uat/uia/egovLoginUsr.do
 * @throws Exception
 */
@RequestMapping("/mdm/SmartMberSbscrb.do")
public String sbscrbMber(@ModelAttribute("smartMberManageVO") SmartMberManageVO smartMberManageVO) throws Exception {

	//가입상태 초기화
	smartMberManageVO.setMberSttus("A");
	//그룹정보 초기화
	smartMberManageVO.setGroupId("GROUP_00000000000000"); //기본그룹
	//일반회원가입신청 등록시 일반회원등록기능을 사용하여 등록한다.
	smartMberManageService.insertMber(smartMberManageVO);
	return "forward:/uat/uia/egovLoginUsr.do";
}

/**
 * 일반회원 약관확인
 * @param model 화면모델
 * @return cmm/uss/umt/EgovStplatCnfirm
 * @throws Exception
 */
@RequestMapping("/mdm/SmartStplatCnfirmMber.do")
public String sbscrbEntrprsMber(Model model) throws Exception {

	// 미인증 사용자에 대한 보안처리
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	if(!isAuthenticated) {
		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	return "uat/uia/EgovLoginUsr";
	}

	//일반회원용 약관 아이디 설정
	String stplatId = "STPLAT_0000000000001";
	//회원가입유형 설정-일반회원
	String sbscrbTy = "USR01";
	//약관정보 조회
	model.addAttribute("stplatList", smartMberManageService.selectStplat(stplatId));
	model.addAttribute("sbscrbTy", sbscrbTy); //회원가입유형 포함

	return "mdm/mber/SmartStplatCnfirm";
}

/**
 * @param model 화면모델
 * @param commandMap 파라메터전달용 commandMap
 * @param userSearchVO 검색조건
 * @param mberManageVO 일반회원수정정보(비밀번호)
 * @return cmm/uss/umt/EgovMberPasswordUpdt
 * @throws Exception
 */
@RequestMapping(value = "/mdm/SmartMberPasswordUpdt.do")
public String updatePassword(ModelMap model, @RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
		@ModelAttribute("smartMberManageVO") SmartMberManageVO smartMberManageVO) throws Exception {

	// 미인증 사용자에 대한 보안처리
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	if(!isAuthenticated) {
		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	return "uat/uia/EgovLoginUsr";
	}

	String oldPassword = (String) commandMap.get("oldPassword");
	String newPassword = (String) commandMap.get("newPassword");
	String newPassword2 = (String) commandMap.get("newPassword2");
	String uniqId = (String) commandMap.get("uniqId");

	boolean isCorrectPassword = false;
	SmartMberManageVO resultVO = new SmartMberManageVO();
	smartMberManageVO.setPassword(newPassword);
	smartMberManageVO.setOldPassword(oldPassword);
	smartMberManageVO.setUniqId(uniqId);

	String resultMsg = "";
	resultVO = smartMberManageService.selectPassword(smartMberManageVO);
	//패스워드 암호화
	String encryptPass = EgovFileScrty.encryptPassword(oldPassword, smartMberManageVO.getMberId());
	if (encryptPass.equals(resultVO.getPassword())) {
		if (newPassword.equals(newPassword2)) {
			isCorrectPassword = true;
		} else {
			isCorrectPassword = false;
			resultMsg = "fail.user.passwordUpdate2";
		}
	} else {
		isCorrectPassword = false;
		resultMsg = "fail.user.passwordUpdate1";
	}

	if (isCorrectPassword) {
		smartMberManageVO.setPassword(EgovFileScrty.encryptPassword(newPassword, smartMberManageVO.getMberId()));
		smartMberManageService.updatePassword(smartMberManageVO);
		model.addAttribute("smartMberManageVO", smartMberManageVO);
		resultMsg = "success.common.update";
	} else {
		model.addAttribute("smartMberManageVO", smartMberManageVO);
	}
	model.addAttribute("userSearchVO", userSearchVO);
	model.addAttribute("resultMsg", resultMsg);

	return "mdm/mber/SmartMberPasswordUpdt";
}

/**
 * 일반회원 암호 수정 화면 이동
 * @param model 화면모델
 * @param commandMap 파라메터전달용 commandMap
 * @param userSearchVO 검색조건
 * @param mberManageVO 일반회원수정정보(비밀번호)
 * @return cmm/uss/umt/EgovMberPasswordUpdt
 * @throws Exception
 */
@RequestMapping(value = "/mdm/SmartMberPasswordUpdtView.do")
public String updatePasswordView(ModelMap model, @RequestParam Map<String, Object> commandMap, @ModelAttribute("searchVO") UserDefaultVO userSearchVO,
		@ModelAttribute("smartMberManageVO") SmartMberManageVO smartMberManageVO) throws Exception {

	// 미인증 사용자에 대한 보안처리
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	if(!isAuthenticated) {
		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    	return "uat/uia/EgovLoginUsr";
	}

	String userTyForPassword = (String) commandMap.get("userTyForPassword");
	smartMberManageVO.setUserTy(userTyForPassword);

	model.addAttribute("userSearchVO", userSearchVO);
	model.addAttribute("smartMberManageVO", smartMberManageVO);
	return "mdm/mber/SmartMberPasswordUpdt";
}

/**
 * 입력한 사용자아이디의 중복확인화면 이동
 * @param model 화면모델
 * @return cmm/uss/umt/EgovIdDplctCnfirm
 * @throws Exception
 */
@RequestMapping(value = "/mdm/SmartIdDplctCnfirmView.do")
public String checkIdDplct(ModelMap model) throws Exception {
	/*
	 * // 미인증 사용자에 대한 보안처리 Boolean isAuthenticated =
	 * EgovUserDetailsHelper.isAuthenticated(); if(!isAuthenticated) {
	 * model.addAttribute("message",
	 * egovMessageSource.getMessage("fail.common.login")); return
	 * "uat/uia/EgovLoginUsr"; }
	 */
	model.addAttribute("checkId", "");
	model.addAttribute("usedCnt", "-1");
	return "mdm/mber/SmartIdDplctCnfirm";
}

/**
 * 입력한 사용자아이디의 중복여부를 체크하여 사용가능여부를 확인
 * @param commandMap 파라메터전달용 commandMap
 * @param model 화면모델
 * @return cmm/uss/umt/EgovIdDplctCnfirm
 * @throws Exception
 */
@RequestMapping(value = "/mdm/SmartIdDplctCnfirm.do")
public String checkIdDplct(@RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {
	/*
	 * // 미인증 사용자에 대한 보안처리 Boolean isAuthenticated =
	 * EgovUserDetailsHelper.isAuthenticated(); if(!isAuthenticated) {
	 * model.addAttribute("message",
	 * egovMessageSource.getMessage("fail.common.login")); return
	 * "uat/uia/EgovLoginUsr"; }
	 */
	String checkId = (String) commandMap.get("checkId");
	checkId = new String(checkId.getBytes("ISO-8859-1"), "UTF-8");

	if (checkId == null || checkId.equals(""))
		return "forward:/mdm/SmartIdDplctCnfirmView.do";

	int usedCnt = smartMberManageService.checkIdDplct(checkId);
	model.addAttribute("usedCnt", usedCnt);
	model.addAttribute("checkId", checkId);

	return "mdm/mber/SmartIdDplctCnfirm";
}
}