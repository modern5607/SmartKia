package egovframework.smart.rcpt.web;


import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.let.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.let.cop.com.service.EgovTemplateManageService;
import egovframework.smart.mdm.service.SmartMdmService;
import egovframework.smart.rcpt.service.SmartRcptService;
import egovframework.smart.rcpt.service.SmartRcptVO;

import org.apache.commons.validator.Var;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@Resource(name = "SmartMdmService")
	private SmartMdmService smartmdmservie;
	
	@RequestMapping(value="/rcpt/SmartWebRcptView.do")
	public String SmartWebRcptView(@ModelAttribute("SmartRcptVO") SmartRcptVO smartrcptVO ,ModelMap model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}
		
		
		Device device = DeviceUtils.getCurrentDevice(request);
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
		Map<String,Object> leadtimelist = smartmdmservice.selectLeadTime(smartrcptVO);
		
		//  System.out.println("leadtimelist :" +leadtimelist.get("main"));
		int totCnt = 1;//Integer.parseInt((String) map.get("resultCnt"));
		// List<Object> servicesysMap = smartmdmservice.SelectCode("AUTO_SYSTEM");
		
		//List<Object> test = smartmdmservice.SelectCode("AUTO_SYSTEM", "CB-Web");
		//System.out.println(test);
		
		//디바이스 구분
		if(device.isNormal())
			model.addAttribute("servicesys",smartmdmservice.SelectCode("AUTO_SYSTEM", "CB-Web"));
		else
			model.addAttribute("servicesys",smartmdmservice.SelectCode("AUTO_SYSTEM", "CB-Mobile"));

		
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("smartrcptVO", smartrcptVO);
		model.addAttribute("leadtime", leadtimelist.get("main"));
		model.addAttribute("autome", smartmdmservice.SelectCmmCode("AUTO_ME"));
		model.addAttribute("autorooms", smartmdmservice.SelectCmmCode("AUTO_ROOM"));
		model.addAttribute("rcptlist", smartrcptservice.SelectRcptList());
		// System.out.println(model.get("rcptlist"));

		model.addAttribute("paginationInfo", paginationInfo);

		return "rcpt/SmartWebRcptView";
	}

	@RequestMapping(value = "/rcpt/SelectLeadtime.do",method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String,Object> SelectLeadtime(@RequestParam Map<String,Object> params, HttpServletResponse response) throws Exception {
		// System.out.println(params.get("selectedvar"));
		List<Object> list = smartrcptservice.SelectMiddleLeadTime(params.get("selectedvar").toString());
		// System.out.println(list);
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("list", list);
		return map;
		//response.getWriter().print(map);
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

	//접수등록
	@RequestMapping(value = "/rcpt/InsertWebRcpt.do")
	public String InsertWebRcpt(@RequestParam Map<String,Object> params,ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		params.put("loginid", id);
		
		System.out.println(params);

		int result = smartrcptservice.InsertWebRcpt(params);
		System.out.println(result);
		if (result == 0) // insert실패
		{
			model.addAttribute("msg","접수 실패, 다시 시도해 주세요.");
			model.addAttribute("url","");
		} else {
			model.addAttribute("msg","접수등록되었습니다.");
			model.addAttribute("url","SmartWebRcptView.do");
		}
		return "alert";
	}

}