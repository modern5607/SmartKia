package egovframework.smart.rcpt.web;


import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.let.cop.bbs.service.EgovBBSAttributeManageService;
import egovframework.let.cop.com.service.EgovTemplateManageService;
import egovframework.smart.customer.service.CusMberDefaultVO;
import egovframework.smart.customer.service.CusMberManageService;
import egovframework.smart.customer.service.CusMberManageVO;
import egovframework.smart.mdm.service.SmartMdmService;
import egovframework.smart.rcpt.service.SmartRcptService;
import egovframework.smart.rcpt.service.SmartRcptVO;
import egovframework.smart.rcpt.service.ReservationVO;

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
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
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
	
	@Resource(name = "cusMberManageService")
	private CusMberManageService cusMberManageService;

	@Autowired
	private DefaultBeanValidator beanValidator;

	@Resource(name = "EgovBBSAttributeManageService")
	private EgovBBSAttributeManageService bbsAttrbService;

	@Resource(name = "SmartMdmService")
	private SmartMdmService smartmdmservice;
	
	@Resource(name = "SmartMdmService")
	private SmartMdmService smartmdmservie;
	
	@RequestMapping(value="/rcpt/SmartWebRcptView.do")
	public String SmartWebRcptView(@ModelAttribute("SmartRcptVO") SmartRcptVO smartrcptVO,ModelMap model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		if(request!=null)
		{
			Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
			if(flashmap != null)
				model.addAttribute("msg",flashmap.get("msg"));
		}
		
			System.out.println("model :"+model);
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

		Map<String,Object> leadtimelist = smartmdmservice.selectLeadTime2();
		int totCnt = 1;//Integer.parseInt((String) map.get("resultCnt"));
		
		//디바이스 구분
		if(device.isNormal())
			model.addAttribute("servicesys",smartmdmservice.SelectCode("AUTO_SYSTEM", "CB-Web"));
		else
			model.addAttribute("servicesys",smartmdmservice.SelectCode("AUTO_SYSTEM", "CB-Mobile"));

		
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("smartrcptVO", smartrcptVO);
		model.addAttribute("leadtimelist", leadtimelist);
		// model.addAttribute("leadtime", leadtimelist.get("main"));
		model.addAttribute("autome", smartmdmservice.SelectCmmCode("AUTO_ME"));
		model.addAttribute("autorooms", smartmdmservice.SelectCmmCode("AUTO_ROOM"));
		model.addAttribute("rcptlist", smartrcptservice.SelectRcptList(smartrcptVO));
		// System.out.println(model.get("rcptlist"));

		model.addAttribute("paginationInfo", paginationInfo);

		return "rcpt/SmartWebRcptView";
	}

	@RequestMapping(value = "/rcpt/SelectLeadtime.do",method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String,Object> SelectLeadtime(@RequestParam Map<String,Object> params, HttpServletResponse response) throws Exception {
		// System.out.println(params.get("selectedvar"));
		List<Object> list = smartrcptservice.SelectMiddleLeadTime(params.get("selectedvar").toString());
		System.out.println(list);
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("list", list);
		return map;
		//response.getWriter().print(map);
	}

	/*
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
		
		smartrcptVO.setPageUnit(propertyService.getInt("pageUnit"));
		smartrcptVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(smartrcptVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(smartrcptVO.getPageUnit());
		paginationInfo.setPageSize(smartrcptVO.getPageSize());

		smartrcptVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		smartrcptVO.setLastIndex(paginationInfo.getLastRecordIndex());
		smartrcptVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model
		Map<String, Object> map = smartrcptservice.selectCommonCodeList(smartrcptVO);
		System.out.println("Map :" + map);
		int totCnt = 1;//Integer.parseInt((String) map.get("resultCnt"));
		System.out.println("Map Size :" +totCnt);
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("smartrcptVO", smartrcptVO);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultDetail", map.get("resultDetail"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);

		return "rcpt/SmartMobileRcptView";
	}
	*/

	//차량조회 팝업화면
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

	//수리사항 검색 팝업화면
	@RequestMapping(value = "/rcpt/searchRepairPopupView.do")
	public String searchRepairPopupView(ModelMap model) throws Exception {		
		model.addAttribute("checkId", "");
		model.addAttribute("usedCnt", "-1");
		return "rcpt/searchRepairPopupView";
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
	public String InsertWebRcpt(@RequestParam Map<String,Object> params,ModelMap model, RedirectAttributes attr) throws Exception {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		params.put("loginid", id);

		System.out.println("params:"+params);
		int result=0;
		//고객 조회
		HashMap<String,Object> customerInfo = smartrcptservice.selectMberList(params);
		//System.out.println("customerInfo len :"+customerInfo.size());
		//System.out.println("customerInfo :"+customerInfo);
		if(params.get("id").toString().equals(""))
			params.put("id",customerInfo.get("CUSTOMER_ID"));

		//새 고객이면 고객 등록
		if(customerInfo == null)
		{
			System.out.println("새 고객입니다 등록하겠습니다.");
			result = smartrcptservice.InsertMber(params);
			System.out.println("고객 등록 결과 :"+result);
			// HashMap<String,Object> custominfo = smartrcptservice.selectMberList(params);
		}
		//접수등록
		result = smartrcptservice.InsertWebRcpt(params);
		
		
		if (result == 0) // insert실패
		{
			// model.addAttribute("msg","수리사항 데이터가 없습니다. 사이트 제작사에 문의해 주세요");
			attr.addFlashAttribute("msg", "수리사항 데이터가 없습니다. 사이트 제작사에 문의해 주세요");
		}
		else{
			// model.addAttribute("msg","접수등록되었습니다.");
			attr.addFlashAttribute("msg", "접수 등록되었습니다.");

		}
		return "redirect:/rcpt/SmartWebRcptView.do";
	}

	//접수현황 수리사항 디테일팝업화면
	@RequestMapping(value = "/rcpt/RepaireDetailPopup.do",method = RequestMethod.GET)
	public String RepaireDetailPopup(@ModelAttribute("SmartRcptVO") SmartRcptVO smartrcptVO ,ModelMap model, String seq) throws Exception
	{
		// 미인증 사용자에 대한 보안처리 
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login")); 
			return	"uat/uia/EgovLoginUsr"; 
		}
		System.out.println(seq);
		Map<String,Object> leadtimelist = smartmdmservice.selectLeadTime2();

		
		model.addAttribute("leadtimelist", leadtimelist);
		model.addAttribute("leadtime", smartmdmservice.selectLeadTime(smartrcptVO).get("main"));
		model.addAttribute("rcptinfo", smartrcptservice.SelectRcptinfo(seq));
		model.addAttribute("autome", smartmdmservice.SelectCmmCode("AUTO_ME"));
		model.addAttribute("RepairList",smartrcptservice.selectRcptRepairInfo(seq));
		// System.out.println(model.get("RepairList"));
		return "rcpt/RepaireDetailPopup";
	}

	//접수 수정
	@RequestMapping(value = "/rcpt/UpdateRepair.do",method=RequestMethod.POST)
	public void UpdateRepair(@RequestParam Map<String,Object> params,ModelMap model,HttpServletResponse response)throws Exception {
		
		// // 미인증 사용자에 대한 보안처리
		// Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		// if (!isAuthenticated) {
		// 	model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
		// 	return "uat/uia/EgovLoginUsr";
		// }

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		params.put("loginid", id);
		System.out.println(params);
		
		//접수수정
		int result = smartrcptservice.UpdateRepair(params);
		System.out.println("최종 결과:"+result);
		
		response.getWriter().print(result);
	}

	//접수취소
	@RequestMapping(value = "/rcpt/CancelWebRcpt.do",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String CancelWebRcpt(@RequestParam("takeseq") String takeseq, RedirectAttributes attr) throws Exception
	{
		int result=0;
		System.out.println(takeseq);

		result = smartrcptservice.CancelWebRcpt(takeseq);
		System.out.println("result :"+result);
		return String.valueOf(result);
	}

	//예약접수취소
	@RequestMapping(value = "/rcpt/CancelWebReservationRcpt.do",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String CancelWebReservationRcpt(@RequestParam("takeseq") String takeseq, RedirectAttributes attr) throws Exception
	{
		int result=0;
		System.out.println(takeseq);

		result = smartrcptservice.CancelWebReservationRcpt(takeseq);
		System.out.println("result :"+result);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/rcpt/ReservationstatusView.do")
	public String ReservationstatusView(@ModelAttribute("ReservationVO") ReservationVO searchVO, ModelMap model,
			@RequestParam(value = "menuNo", required = false) String menuNo,
			HttpServletRequest request) throws Exception {
		
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
		Map<String, Object> map = smartrcptservice.searchReservation(searchVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "/rcpt/ReservationstatusView";
	}
	@RequestMapping(value="/rcpt/SmartWebReservationRcptView.do")
	public String SmartWebReservationRcptView(@ModelAttribute("SmartRcptVO") SmartRcptVO smartrcptVO,ModelMap model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		if(request!=null)
		{
			Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
			if(flashmap != null)
				model.addAttribute("msg",flashmap.get("msg"));
		}
		
			System.out.println("model :"+model);
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

		Map<String,Object> leadtimelist = smartmdmservice.selectLeadTime2();
		int totCnt = 1;//Integer.parseInt((String) map.get("resultCnt"));
		
		//디바이스 구분
		if(device.isNormal())
			model.addAttribute("servicesys",smartmdmservice.SelectCode("AUTO_SYSTEM", "CB-Web"));
		else
			model.addAttribute("servicesys",smartmdmservice.SelectCode("AUTO_SYSTEM", "CB-Mobile"));

		
		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("smartrcptVO", smartrcptVO);
		model.addAttribute("leadtimelist", leadtimelist);
		// model.addAttribute("leadtime", leadtimelist.get("main"));
		model.addAttribute("hour", smartmdmservice.SelectCmmCode("AUTO_HOUR"));
		model.addAttribute("autome", smartmdmservice.SelectCmmCode("AUTO_ME"));
		model.addAttribute("autorooms", smartmdmservice.SelectCmmCode("AUTO_ROOM"));
		model.addAttribute("reservelist", smartrcptservice.SelectReservationRcptList(smartrcptVO));
		System.out.println("reservelist:"+model.get("reservelist"));

		model.addAttribute("paginationInfo", paginationInfo);

		return "rcpt/SmartWebReservationRcptView";
	}

	//예약접수등록
	@RequestMapping(value = "/rcpt/InsertWebReservationRcpt.do")
	public String InsertWebReservationRcpt(@RequestParam Map<String,Object> params,ModelMap model, RedirectAttributes attr) throws Exception {
		System.out.println(params);

		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		params.put("loginid", id);

		System.out.println("params:"+params);
		int result=0;
		//고객 조회
		HashMap<String,Object> customerInfo = smartrcptservice.selectMberList(params);
		//System.out.println("customerInfo len :"+customerInfo.size());
		//System.out.println("customerInfo :"+customerInfo);
		if(params.get("id").toString().equals(""))
			params.put("id",customerInfo.get("CUSTOMER_ID"));

		//새 고객이면 고객 등록
		if(customerInfo == null)
		{
			System.out.println("새 고객입니다 등록하겠습니다.");
			result = smartrcptservice.InsertMber(params);
			System.out.println("고객 등록 결과 :"+result);
			// HashMap<String,Object> custominfo = smartrcptservice.selectMberList(params);
		}
		//접수등록
		result = smartrcptservice.InsertWebRcpt(params);
		
		
		if (result == 0) // insert실패
			attr.addFlashAttribute("msg", "수리사항 데이터가 없습니다. 사이트 제작사에 문의해 주세요");
		else
			attr.addFlashAttribute("msg", "접수 등록되었습니다.");

		return "redirect:/rcpt/SmartWebReservationRcptView.do";
	}

	@RequestMapping(value = "/rcpt/ajaxWebReservationRcptlist.do")
	@ResponseBody
	public List<Object> ajaxWebReservationRcptlist(@RequestParam("date")String date)throws Exception{
		System.out.println(date);
		List<Object> list = smartrcptservice.ajaxWebReservationRcptlist(date);
		return list;
	}

	@RequestMapping("/rcpt/Rcptprint.do")
	public String Rcptprint(@RequestParam Map<String,Object> params,ModelMap model)throws Exception{
		System.out.println(params);
		String takeseq = params.get("printseq").toString();
		List<Object> info = smartrcptservice.SelectRcptinfo(takeseq);
		List<Object> repairs = smartrcptservice.selectRcptRepairInfo(takeseq);
		System.out.println(info);
		System.out.println(repairs);
		model.addAttribute("info", info.get(0));
		model.addAttribute("repairs", repairs);
		return "/rcpt/Rcptprint";
	}
}