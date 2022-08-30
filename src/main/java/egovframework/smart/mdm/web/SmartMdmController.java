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
import egovframework.let.cop.bbs.service.BoardMasterVO;
import egovframework.let.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.cop.com.service.EgovTemplateManageService;
import egovframework.let.cop.com.service.TemplateInfVO;
import egovframework.let.uss.ion.bnr.service.Banner;
import egovframework.let.uss.ion.bnr.service.BannerVO;
import egovframework.let.uss.ion.bnr.service.EgovBannerService;
import egovframework.let.uss.olh.qna.service.QnaManageDefaultVO;
import egovframework.let.uss.olh.qna.service.QnaManageVO;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.smart.mdm.service.SmartMdmBizVO;
import egovframework.smart.mdm.service.SmartMdmService;

import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

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

	@Resource(name="SmartMdmService")
	private SmartMdmService smartmdmservice;
	
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@Resource(name = "EgovBBSAttributeManageService")
	private EgovBBSAttributeManageService bbsAttrbService;
	
	
	/**
	 * MyPage에 배너정보를 제공하기 위해 목록을 조회한다.
	 * @param bannerVO - 배너 VO
	 * @return String - 리턴 URL
	 * @throws Exception
	 */
	
	@RequestMapping(value = "/mdm/SmartCode.do")
	public String selectCode(@ModelAttribute("searchVO") ComDefaultVO searchVO,ModelMap model,
			@RequestParam(value = "menuNo", required = false) String menuNo,
			HttpServletRequest request
			) throws Exception 
	{
		System.out.println(searchVO);
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
		// 	loginVO = new LoginVO();
		// }
		
		searchVO.setPageUnit(propertyService.getInt("pageUnit"));
		searchVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> map = smartmdmservice.selectCommonCodeList(searchVO);
		System.out.println("Map :" +map);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		System.out.println("Map Size :" +totCnt);

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);

		return "/mdm/SmartCode";
	}
	/*
	
	/**
	 * 거래처 관리 화면
	 */
	@RequestMapping(value = "/mdm/SmartBiz.do")
	public String selectBiz(@ModelAttribute("SmartMdmBizVO") SmartMdmBizVO searchVO,ModelMap model,
			@RequestParam(value = "menuNo", required = false) String menuNo,
			HttpServletRequest request
			) throws Exception 
		{
		System.out.println(searchVO);
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
		
		// paging 
		searchVO.setPageUnit(propertyService.getInt("pageUnit"));
		searchVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		// service 
		Map<String, Object> map = smartmdmservice.selectBizList(searchVO);
		System.out.println("Map: "+map);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);

		return "/mdm/SmartBiz";
	}
	
	/**
	 * 거래처 관리 등록화면
	 */
	@RequestMapping(value = "/mdm/SmartaddBiz.do")
	public String SmartaddBiz(@ModelAttribute("SmartMdmBizVO") SmartMdmBizVO smartmdmbizVO, Model model) throws Exception {
		
		return "/mdm/SmartaddBiz";
	}

	/**
	 * 거래처 관리 등록
	 */
	
	@RequestMapping(value = "/mdm/InsertSmartaddBiz.do")
	public void InsertSmartaddBiz( @ModelAttribute("SmartMdmBizVO") SmartMdmBizVO smartmdmbizVO,
			ModelMap model, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
	
		int result = smartmdmservice.insertaddBiz(smartmdmbizVO);
		if (result == 0) // insert실패
		{
			out.println("<script>");
			out.println("alert('업체코드가 중복입니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('성공적으로 등록되었습니다.')");
			out.println("location.href='/mdm/SmartBiz.do'");
			out.println("</script>");
		}
	}
	
	/**
	 * 중복 코드 검사 View
	 */
	@RequestMapping(value = "/mdm/SmartChkcodeview.do")
	public String checkbizcode(ModelMap model) throws Exception {
		
		System.out.println(model);
		model.addAttribute("checkId", "");
		model.addAttribute("usedCnt", "-1");
		return "/mdm/SmartChkcode";
	}

	/**
	 * 중복여부 체크 
	 */
	@RequestMapping(value = "/mdm/SmartChkcode.do")
	public String checkbizcode(@RequestParam Map<String, Object> commandMap, ModelMap model) throws Exception {
		String checkId = (String) commandMap.get("checkId");
		checkId = new String(checkId.getBytes("ISO-8859-1"), "UTF-8");
		System.out.println(model);
		if (checkId == null || checkId.equals(""))
			return "forward:mdm/SmartChkcodeview.do";

		int usedCnt = smartmdmservice.checkCustid(checkId);
		model.addAttribute("usedCnt", usedCnt);
		model.addAttribute("checkId", checkId);

		return "/mdm/SmartChkcode";
	}

	/*

	@RequestMapping("/kiosk/selectKioskin.do")
	public String selectKioskin(@ModelAttribute("searchVO") TemplateInfVO tmplatInfVO, ModelMap model,
		@RequestParam(value = "menuNo", required = false) String menuNo,
		HttpServletRequest request
		) throws Exception {
		
		// 선택된 메뉴정보를 세션으로 등록한다.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}	

		Map<String, Object> map = tmplatService.selectTemplateInfs(tmplatInfVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("result", null);
		
		return "/kiosk/SmartStandardIn";
	}
	
	@RequestMapping("/kiosk/selectKioskinsurance.do")
	public String selectKioskinsurance(@ModelAttribute("searchVO") TemplateInfVO tmplatInfVO, ModelMap model,
		@RequestParam(value = "menuNo", required = false) String menuNo,
		HttpServletRequest request
		) throws Exception {
		
		// 선택된 메뉴정보를 세션으로 등록한다.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}	

		Map<String, Object> map = tmplatService.selectTemplateInfs(tmplatInfVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("result", null);
		
		return "/kiosk/SmartStandardInsurance";
	}
	*/
}
