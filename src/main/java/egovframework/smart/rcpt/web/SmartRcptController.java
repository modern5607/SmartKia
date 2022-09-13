package egovframework.smart.rcpt.web;


import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.let.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.let.cop.com.service.EgovTemplateManageService;
import egovframework.smart.mdm.service.SmartMdmService;
import egovframework.smart.rcpt.service.SmartRcptService;
import egovframework.smart.rcpt.service.SmartRcptVO;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

@Controller
public class SmartRcptController {

	@Resource(name = "EgovTemplateManageService")
	private EgovTemplateManageService tmplatService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "SmartRcptService")
	private SmartRcptService smartrcptservice;

	@Autowired
	private DefaultBeanValidator beanValidator;

	@Resource(name = "EgovBBSAttributeManageService")
	private EgovBBSAttributeManageService bbsAttrbService;

	@Resource(name = "SmartMdmService")
	private SmartMdmService smartmdmservice;
	
	@RequestMapping(value="/rcpt/SmartWebRcptView.do")
	public String SmartWebRcptView(@ModelAttribute("SmartRcptVO") SmartRcptVO smartrcptVO ,ModelMap model ) throws Exception{
		
		smartrcptVO.setPageUnit(propertyService.getInt("pageUnit"));
		smartrcptVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(smartrcptVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(smartrcptVO.getPageUnit());
		paginationInfo.setPageSize(smartrcptVO.getPageSize());

		smartrcptVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		smartrcptVO.setLastIndex(paginationInfo.getLastRecordIndex());
		smartrcptVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// model
		// Map<String, Object> map = smartrcptservice.selectCommonCodeList(smartrcptVO);
		// System.out.println("Map :" + map);
		int totCnt = 1;//Integer.parseInt((String) map.get("resultCnt"));
		// System.out.println("Map Size :" +totCnt);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("smartrcptVO", smartrcptVO);
		// model.addAttribute("resultList", map.get("resultList"));
		// model.addAttribute("resultDetail", map.get("resultDetail"));
		// model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);

		return "rcpt/SmartWebRcptView";
	}

	//모바일 예약 접수등록
	@RequestMapping(value="/rcpt/SmartMobileRcptView.do")
	public String SmartMobileRcptView(@ModelAttribute("SmartRcptVO") SmartRcptVO smartrcptVO ,ModelMap model,HttpServletRequest request,HttpServletResponse response ) throws Exception{
		Device device = DeviceUtils.getCurrentDevice(request);

		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();

		
		if(device.isMobile())
			System.out.println("모바일 접속");
		else
		{
			System.out.println("PC 접속");
			out.println("<script>");
			out.println("alert('모바일로 접속해 주세요.')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		}
		
		// smartrcptVO.setPageUnit(propertyService.getInt("pageUnit"));
		// smartrcptVO.setPageSize(propertyService.getInt("pageSize"));

		//PaginationInfo paginationInfo = new PaginationInfo();

		//paginationInfo.setCurrentPageNo(smartrcptVO.getPageIndex());
		//paginationInfo.setRecordCountPerPage(smartrcptVO.getPageUnit());
		//paginationInfo.setPageSize(smartrcptVO.getPageSize());

		// smartrcptVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		// smartrcptVO.setLastIndex(paginationInfo.getLastRecordIndex());
		// smartrcptVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// model
		// Map<String, Object> map = smartrcptservice.selectCommonCodeList(smartrcptVO);
		// System.out.println("Map :" + map);
		//int totCnt = 1;//Integer.parseInt((String) map.get("resultCnt"));
		// System.out.println("Map Size :" +totCnt);
		//paginationInfo.setTotalRecordCount(totCnt);

		// model.addAttribute("smartrcptVO", smartrcptVO);
		// model.addAttribute("resultList", map.get("resultList"));
		// model.addAttribute("resultDetail", map.get("resultDetail"));
		// model.addAttribute("resultCnt", map.get("resultCnt"));
		//model.addAttribute("paginationInfo", paginationInfo);

		return "rcpt/SmartMobileRcptView";
	}

	
	@RequestMapping(value = "/rcpt/searchCarPopupView.do")
	public String searchCarPopupView(ModelMap model) throws Exception {
		/*
		 * // 미인증 사용자에 대한 보안처리 Boolean isAuthenticated =
		 * EgovUserDetailsHelper.isAuthenticated(); if(!isAuthenticated) {
		 * model.addAttribute("message",
		 * egovMessageSource.getMessage("fail.common.login")); return
		 * "uat/uia/EgovLoginUsr"; }
		 */
		model.addAttribute("checkId", "");
		model.addAttribute("usedCnt", "-1");
		return "rcpt/searchCarPopupView";
	}

	//차량 조회팝업
	@RequestMapping(value = "/rcpt/checkcarinfo.do")
	public String checkcarinfo(@ModelAttribute("SmartRcptVO") SmartRcptVO smartrcptVO, ModelMap model) throws Exception {
		/*
		 * // 미인증 사용자에 대한 보안처리 Boolean isAuthenticated =
		 * EgovUserDetailsHelper.isAuthenticated(); if(!isAuthenticated) {
		 * model.addAttribute("message",
		 * egovMessageSource.getMessage("fail.common.login")); return
		 * "uat/uia/EgovLoginUsr"; }
		 */
		System.out.println(smartrcptVO);
		String checkCar = (String) smartrcptVO.getCheckcarnum();
		checkCar = new String(checkCar.getBytes("ISO-8859-1"), "UTF-8");

		if (checkCar == null || checkCar.equals(""))
			return "forward:/rcpt/searchCarPopupView.do";
		Map<String,Object> map = new HashMap<String,Object>();
		model.addAttribute("CarList",smartrcptservice.selectCarInfo(smartrcptVO));

		return "rcpt/searchCarPopupView";
	}

	@RequestMapping(value = "/rcpt/selectmain.do")
	public String selectmain(@ModelAttribute("SmartRcptVO") SmartRcptVO smartrcptVO, ModelMap model) throws Exception {
		Map<String, Object> map = smartmdmservice.selectLeadTime(smartrcptVO);
		model.addAttribute("smartrcptVO", smartrcptVO);
		model.addAttribute("leadtimelist", map.get("leadtime"));
		model.addAttribute("mainlist", map.get("main"));
		model.addAttribute("middlelist", map.get("middle"));
		model.addAttribute("sublist", map.get("sub"));
	}

	@RequestMapping(value = "/rcpt/selectmiddle.do")
	public String selectmiddle(@ModelAttribute("SmartRcptVO") SmartRcptVO smartrcptVO, ModelMap model) throws Exception {
		
	}

}