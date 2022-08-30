package egovframework.smart.mdm.web;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.cop.com.service.EgovTemplateManageService;
import egovframework.let.cop.com.service.TemplateInfVO;
import egovframework.let.uss.ion.bnr.service.Banner;
import egovframework.let.uss.ion.bnr.service.BannerVO;
import egovframework.let.uss.ion.bnr.service.EgovBannerService;
import egovframework.let.uss.umt.service.MberManageVO;
import egovframework.smart.mdm.service.SmartCommonCodeVO;
import egovframework.smart.mdm.service.SmartLeadTimeVO;
import egovframework.smart.mdm.service.SmartMdmService;

import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.sun.mail.iap.Response;

@Controller
public class SmartMdmController {

	@Resource(name = "EgovTemplateManageService")
	private EgovTemplateManageService tmplatService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "SmartMdmService")
	private SmartMdmService smartmdmservice;

	@Autowired
	private DefaultBeanValidator beanValidator;

	@RequestMapping(value = "/mdm/SmartCode.do")
	public String selectCode(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model,
			@RequestParam(value = "menuNo", required = false) String menuNo,
			HttpServletRequest request) throws Exception {

		System.out.println("comCodeVO : "+comCodeVO);
		// 선택된 메뉴정보를 세션으로 등록한다.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}

		// 0. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		// // 로그인 객체 선언
		// LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		// if (loginVO == null) {
		// loginVO = new LoginVO();
		// }

		comCodeVO.setPageUnit(propertyService.getInt("pageUnit"));
		comCodeVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(comCodeVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(comCodeVO.getPageUnit());
		paginationInfo.setPageSize(comCodeVO.getPageSize());

		comCodeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		comCodeVO.setLastIndex(paginationInfo.getLastRecordIndex());
		comCodeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// model
		Map<String, Object> map = smartmdmservice.selectCommonCodeList(comCodeVO);
		//System.out.println("Map :" + map);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));
		// System.out.println("Map Size :" +totCnt);

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("comCodeVO", comCodeVO);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultDetail", map.get("resultDetail"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);

		return "/mdm/SmartCode";
	}

	//-------------------공통코드 상위 --------------------------------
	// 그룹공통코드 등록 뷰
	@RequestMapping(value = "/mdm/InsertCommonGroupCodeView.do")
	public String InsertCommonGroupCodeView(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO,
			ModelMap model) throws Exception {
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		return "mdm/InsertCommonGroupCodeView";
	}

	// 공통그룹코드 등록
	@RequestMapping(value = "/mdm/InsertCommonGroupCode.do")
	public void InsertCommonGroupCode(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		comCodeVO.setCurrentid(id);

		System.out.println("GC : " + comCodeVO.getGroupcode());
		System.out.println("GNm : " + comCodeVO.getGroupname());

		int result = smartmdmservice.InsertCommonGroupCode(comCodeVO);
		if (result == 0) // insert실패
		{
			out.println("<script>");
			out.println("alert('이미 존재하는 코드입니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('성공적으로 등록되었습니다.')");
			out.println("location.href='/mdm/SmartCode.do'");
			out.println("</script>");
		}
	}

	// 공통그룹코드 수정 뷰
	@RequestMapping(value = "mdm/UpdateCommonGroupCodeView.do")
	public String UpdateCommonGroupCodeView(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model) throws Exception {
		
		Map<String,Object> info = smartmdmservice.SelectCommonGroupCode(comCodeVO);
		System.out.println("info : "+info.get("info"));
		model.addAttribute("info", info.get("info"));
		model.addAttribute("previousgroupcode",comCodeVO.getGroupcode());
		return "mdm/UpdateCommonGroupCodeView";
	}
	// 공통그룹코드 수정
	@RequestMapping(value = "mdm/UpdateCommonGroupCode.do")
	public void UpdateCommonGroupCode(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model,HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		comCodeVO.setCurrentid(id);
		System.out.println(comCodeVO);
		
		
		int result = smartmdmservice.UpdateCommonGroupCode(comCodeVO);
		
		if (result == 0) //실패
		{
			out.println("<script>");
			out.println("alert('이미 존재하는 코드입니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('성공적으로 수정되었습니다.')");
			out.println("location.href='/mdm/SmartCode.do'");
			out.println("</script>");
		}
	}


	//-------------------공통코드 하위 --------------------------------
	// 공통코드 등록 뷰
	@RequestMapping(value = "/mdm/InsertCommonCodeView.do")
	public String InsertCommonCodeView(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model) throws Exception {
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}
		System.out.println(comCodeVO);
		//그룹코드 리스트가져오기

		//모델 attribute 등록
		model.addAttribute("comCodeVO", comCodeVO);

		return "mdm/InsertCommonCodeView";
	}

	// 공통코드 등록
	@RequestMapping(value = "/mdm/InsertCommonCode.do")
	public void InsertCommonCode(@ModelAttribute("comCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model, HttpServletResponse response) throws Exception 
	{
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();

		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		comCodeVO.setCurrentid(id);

		System.out.println("GroupCode : " + comCodeVO.getGroupcode());
		System.out.println("Code : " + comCodeVO.getCode());
		System.out.println("CodeNm : " + comCodeVO.getName());

		int result = smartmdmservice.InsertCommonCode(comCodeVO);
		if (result == 0) // insert실패
		{
			out.println("<script>");
			out.println("alert('이미 존재하는 코드입니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('성공적으로 등록되었습니다.')");
			out.println("location.href='/mdm/SmartCode.do'");
			out.println("</script>");
		}
	}

	// 공통코드 수정 뷰
	@RequestMapping(value = "mdm/UpdateCommonCodeView.do")
	public String UpdateCommonCodeView(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model) throws Exception {
		System.out.println(comCodeVO);
		Map<String,Object> info = smartmdmservice.SelectCommonGroupCode(comCodeVO);
		// System.out.println("info : "+info.get("info"));
		// model.addAttribute("info", info.get("info"));
		// model.addAttribute("previousgroupcode",comCodeVO.getGroupcode());
		return "mdm/UpdateCommonCodeView";
	}
	
	
	//-----표준작업관리-----------
	@RequestMapping(value = "/mdm/SmartLeadTime.do")
	public String SmartLeadTime(@ModelAttribute("SmartCommonCodeVO") SmartLeadTimeVO leadtimeVO, ModelMap model,
			@RequestParam(value = "menuNo", required = false) String menuNo,
			HttpServletRequest request) throws Exception {

		System.out.println("comCodeVO : "+leadtimeVO);
		
		
		// 선택된 메뉴정보를 세션으로 등록한다.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}

		// 0. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		// // 로그인 객체 선언
		// LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		// if (loginVO == null) {
		// loginVO = new LoginVO();
		// }
		
		

		leadtimeVO.setPageUnit(propertyService.getInt("pageUnit"));
		leadtimeVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(leadtimeVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(leadtimeVO.getPageUnit());
		paginationInfo.setPageSize(leadtimeVO.getPageSize());

		leadtimeVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		leadtimeVO.setLastIndex(paginationInfo.getLastRecordIndex());
		leadtimeVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = smartmdmservice.selectLeadTime(leadtimeVO);
		System.out.println("Map :" + map);

		model.addAttribute("comCodeVO", leadtimeVO);
		model.addAttribute("leadtimelist", map.get("leadtime"));
		model.addAttribute("mainlist", map.get("main"));
		model.addAttribute("middlelist", map.get("middle"));
		model.addAttribute("sublist", map.get("sub"));
		model.addAttribute("paginationInfo", paginationInfo);

		return "/mdm/SmartLeadTimeView";
	}
	
	
	@RequestMapping(value="/mdm/UpdateLeadTime.do")
	public void UpdateLeadTime(@RequestParam("auto002code") String code,@RequestParam("leadtime") String leadtimeidx)
	{
		System.out.println("code : "+ code);
		System.out.println("idx : "+ leadtimeidx);
	}
	
	/*
	 * 
	 * @RequestMapping("/kiosk/selectKioskin.do")
	 * public String selectKioskin(@ModelAttribute("searchVO") TemplateInfVO
	 * tmplatInfVO, ModelMap model,
	 * 
	 * @RequestParam(value = "menuNo", required = false) String menuNo,
	 * HttpServletRequest request
	 * ) throws Exception {
	 * 
	 * // 선택된 메뉴정보를 세션으로 등록한다.
	 * if (menuNo != null && !menuNo.equals("")) {
	 * request.getSession().setAttribute("menuNo", menuNo);
	 * }
	 * 
	 * Map<String, Object> map = tmplatService.selectTemplateInfs(tmplatInfVO);
	 * int totCnt = Integer.parseInt((String) map.get("resultCnt"));
	 * 
	 * model.addAttribute("resultList", map.get("resultList"));
	 * model.addAttribute("resultCnt", map.get("resultCnt"));
	 * model.addAttribute("result", null);
	 * 
	 * return "/kiosk/SmartStandardIn";
	 * }
	 * 
	 * @RequestMapping("/kiosk/selectKioskinsurance.do")
	 * public String selectKioskinsurance(@ModelAttribute("searchVO") TemplateInfVO
	 * tmplatInfVO, ModelMap model,
	 * 
	 * @RequestParam(value = "menuNo", required = false) String menuNo,
	 * HttpServletRequest request
	 * ) throws Exception {
	 * 
	 * // 선택된 메뉴정보를 세션으로 등록한다.
	 * if (menuNo != null && !menuNo.equals("")) {
	 * request.getSession().setAttribute("menuNo", menuNo);
	 * }
	 * 
	 * Map<String, Object> map = tmplatService.selectTemplateInfs(tmplatInfVO);
	 * int totCnt = Integer.parseInt((String) map.get("resultCnt"));
	 * 
	 * model.addAttribute("resultList", map.get("resultList"));
	 * model.addAttribute("resultCnt", map.get("resultCnt"));
	 * model.addAttribute("result", null);
	 * 
	 * return "/kiosk/SmartStandardInsurance";
	 * }
	 */
}
