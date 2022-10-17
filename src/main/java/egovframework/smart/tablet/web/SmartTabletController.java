package egovframework.smart.tablet.web;

import java.io.PrintWriter;
import java.util.HashMap;
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
import egovframework.smart.mdm.service.SmartCommonCodeVO;
import egovframework.smart.mdm.service.SmartLeadTimeVO;
import egovframework.smart.mdm.service.SmartMdmBizVO;
import egovframework.smart.mdm.service.SmartMdmService;
import egovframework.smart.monitoring.service.SmartMonitoringService;
import egovframework.smart.rcpt.service.SmartRcptService;
import egovframework.smart.tablet.service.SmartTabletService;
import egovframework.smart.tablet.service.SmartTabletVO;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

@Controller
public class SmartTabletController {

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
	
	@Resource(name = "SmartTabletService")
	private SmartTabletService smarttabletservice;
	
	@Resource(name = "SmartRcptService")
	private SmartRcptService smartrcptservice;
	
	@Resource(name = "SmartMonitoringService")
	private SmartMonitoringService smartMonitoringService;

	@Autowired
	private DefaultBeanValidator beanValidator;

	@Resource(name = "EgovBBSAttributeManageService")
	private EgovBBSAttributeManageService bbsAttrbService;

	/**
	 * 접수현황 View
	 */
	@RequestMapping(value = "/tablet/SmartAssignGroup.do")
	public String selectAssignGroup(@ModelAttribute("SmartTabletVO") SmartTabletVO searchVO, ModelMap model,
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
		Map<String, Object> map = smarttabletservice.assignmentList(searchVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "/tablet/SmartAssignGroup";
	}
	/*
	 * 작업반 배정 상세 View
	 * */
	@RequestMapping(value = "/tablet/ReceiveGroupPOP.do",method = RequestMethod.GET)
	public String ReceivePopView(@ModelAttribute("SmartTabletVO") SmartTabletVO searchVO, ModelMap model ,String seq) throws Exception {

		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();		
		searchVO.setLoginid(loginVO.getUniqId().toString());
		model.addAttribute("logininfo",smarttabletservice.selectlogininfo(searchVO));
		model.addAttribute("autorooms", smartmdmservice.SelectCmmCode("AUTO_ROOM"));
		model.addAttribute("autome", smartmdmservice.SelectCmmCode("AUTO_ME"));

		System.out.println("searchVO : "+searchVO);
		model.addAttribute("carlist",smarttabletservice.selectcarlist(seq));
		Map<String,Object> leadtimelist = smartmdmservice.selectLeadTime2();
		model.addAttribute("leadtimelist", leadtimelist);
		model.addAttribute("RepairList",smartrcptservice.selectRcptRepairInfo(seq));
		
		
		return "/tablet/ReceiveGroupPOP";
	}
	
	/*
	 * 작업반 배정 업데이트
	 * */
	@RequestMapping(value = "/tablet/SaveReceive.do",method=RequestMethod.POST)
	public void SaveReceive(@RequestParam Map<String,Object> params,SmartTabletVO vo,ModelMap model,HttpServletResponse response) throws Exception {
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		params.put("loginid", id);
		System.out.println(params);

		//접수수정
		int result = smarttabletservice.UpdateAssign(params);
		System.out.println(result);
		
		response.getWriter().print(result);
		
	}
	/**
	 * 작업현황 메인 뷰
	 */
	@RequestMapping(value = "/tablet/SmartWorkGroup.do")
	public String selectList(@ModelAttribute("SmartTabletVO") SmartTabletVO searchVO, ModelMap model,
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
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		
		searchVO.setLoginid(loginVO.getUniqId().toString());
		

		// service
		model.addAttribute("logininfo",smarttabletservice.selectlogininfo(searchVO));
		System.out.println("model :"+model);
		//System.out.println("list : "+((HashMap<String,Object>)model.get("logininfo")).get(0));
		model.addAttribute("autorooms", smartmdmservice.SelectCmmCode("AUTO_ROOM"));
		
		Map<String, Object> map = smarttabletservice.selectList(searchVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("searchVO",searchVO);
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "/tablet/SmartWorkGroup";
	
	}
	/*
	 * 입고 취소 view
	 * */
	@RequestMapping(value = "/tablet/ReceiveCancelPOP.do",method = RequestMethod.GET)
	public String ReceiveCancelview(@RequestParam String seq,ModelMap model) throws Exception {
		
		
		model.addAttribute("seq",seq);
		return "/tablet/ReceiveCancelPOP";
	}
	/**
	 * 입고 취소 UPDATE
	 */
	@RequestMapping(value = "/tablet/ReceiveCancel.do")
	public String ReceiveCancel(@RequestParam Map<String,Object> params,SmartTabletVO vo,ModelMap model) throws Exception {
		
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		params.put("loginid", id);
		
		System.out.println("params :"+params);
		
		int result = smarttabletservice.cancelreceive(params);
		System.out.println("result : "+ result);
		
		if(result==0) //log insert 실패 
		{
			model.addAttribute("msg","입고취소가 실패했습니다 다시시도해주세요.");
			model.addAttribute("url","");
		}
		else 
		{
			model.addAttribute("msg","입고가 취소되었습니다.");
			model.addAttribute("url","SmartWorkGroup.do");
		}
		
		return "alert";
	}
	/**
	 * 작업상태 완료처리 view
	 */
	@RequestMapping(value = "/tablet/CompletePOP.do",method = RequestMethod.GET)
	public String CompleteView(@ModelAttribute("SmartTabletVO") SmartTabletVO searchVO, String seq,ModelMap model) throws Exception {
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();		
		searchVO.setLoginid(loginVO.getUniqId().toString());
		model.addAttribute("logininfo",smarttabletservice.selectlogininfo(searchVO));
		model.addAttribute("autorooms", smartmdmservice.SelectCmmCode("AUTO_ROOM"));
		model.addAttribute("autome", smartmdmservice.SelectCmmCode("AUTO_ME"));

		System.out.println("searchVO : "+searchVO);
		model.addAttribute("carlist",smarttabletservice.selectcarlist(seq));
		Map<String,Object> leadtimelist = smartmdmservice.selectLeadTime2();
		model.addAttribute("leadtimelist", leadtimelist);
		model.addAttribute("RepairList",smartrcptservice.selectRcptRepairInfo(seq));

		return "/tablet/CompletePOP";
	}
	/*
	 * 정비완료 UPDATRE
	 * */
	@RequestMapping(value = "/tablet/RepairComplete.do",method=RequestMethod.POST)
	public void RepairComplete(@RequestParam Map<String,Object> params,SmartTabletVO vo,ModelMap model,HttpServletResponse response) throws Exception {
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		params.put("loginid", id);
		System.out.println(params);

		//정비수정
		
		int result = smarttabletservice.RepairComplete(params);
		System.out.println(result);
		
		response.getWriter().print(result);
	
	}
	/*
	 * 반별진행내역 View
	 */
	@RequestMapping(value = "/tablet/ProgressDetail.do")
	public String ProgressDetailView(@ModelAttribute("SmartTabletVO") SmartTabletVO searchVO, ModelMap model,
	@RequestParam(value="menuNo",required = false)HttpServletRequest request) throws Exception {
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		searchVO.setPageUnit(propertyService.getInt("pageUnit"));
		searchVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		model.addAttribute("autorooms", smartmdmservice.SelectCmmCode("AUTO_ROOM"));

		System.out.println(searchVO);
		Map<String,Object> map = smarttabletservice.detailList(searchVO);

		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);


		return "/tablet/ProgressDetail";
	}
	/*
	 * 출고처리 View
	 */
	@RequestMapping(value = "/tablet/ReleasePOP.do",method = RequestMethod.GET)
	public String ReleasePOPview(@ModelAttribute("SmartTabletVO") SmartTabletVO searchVO, String seq,ModelMap model) throws Exception {
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();		
		searchVO.setLoginid(loginVO.getUniqId().toString());
		model.addAttribute("logininfo",smarttabletservice.selectlogininfo(searchVO));
		model.addAttribute("autorooms", smartmdmservice.SelectCmmCode("AUTO_ROOM"));
		model.addAttribute("autome", smartmdmservice.SelectCmmCode("AUTO_ME"));

		System.out.println("searchVO : "+searchVO);
		System.out.println("model : "+ model);
		model.addAttribute("carlist",smarttabletservice.selectcarlist(seq));
		Map<String,Object> leadtimelist = smartmdmservice.selectLeadTime2();
		model.addAttribute("leadtimelist", leadtimelist);
		model.addAttribute("RepairList",smartrcptservice.selectRcptRepairInfo(seq));

		return "/tablet/ReleasePOP";
	}

	/*
	 * 출고처리 UPDATRE
	 * */
	@RequestMapping(value = "/tablet/ReleaseRepair.do",method=RequestMethod.POST)
	public void ReleaseRepair(@RequestParam Map<String,Object> params,SmartTabletVO vo,ModelMap model,HttpServletResponse response) throws Exception {
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		params.put("loginid", id);
		System.out.println(params);

		//출고완료
		
		int result = smarttabletservice.ReleaseRepair(params);
		System.out.println(result);
		
		response.getWriter().print(result);
	
	}

/*********************************************************************************************************************************
 * 											태블릿 Controller
 * *******************************************************************************************************************************/

 /*
  * 작업반 배정 view
  */
@RequestMapping(value = "/tablet/TabletAssignGroup.do")
	public String TabletAssignGroup(@ModelAttribute("SmartTabletVO") SmartTabletVO searchVO, ModelMap model,
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
		// service
		Map<String, Object> map = smarttabletservice.assignmentList(searchVO);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		
		
		return "/tablet/TabletAssignGroup";
	}

/*
 * 작업 현황 view
 */
@RequestMapping(value = "/tablet/TabletWorkGroup.do")
	public String TabletWorkGroup(@ModelAttribute("SmartTabletVO") SmartTabletVO searchVO, ModelMap model,
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

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		searchVO.setLoginid(loginVO.getUniqId().toString());
		

		// service
		model.addAttribute("logininfo",smarttabletservice.selectlogininfo(searchVO));
			System.out.println("model1 :"+model);
		// service
		model.addAttribute("TeamA", smartMonitoringService.SceneMonitoring("CB-A"));
		model.addAttribute("TeamB", smartMonitoringService.SceneMonitoring("CB-B"));
		model.addAttribute("TeamC", smartMonitoringService.SceneMonitoring("CB-C"));
		System.out.println("model2 :"+model);
		
		return "/tablet/TabletWorkGroup";
	}

	//
	@RequestMapping(value ="/tablet/TabletAssignView.do")
	public String a(@ModelAttribute("SmartTabletVO") SmartTabletVO searchVO,@RequestParam Map<String,Object> params, ModelMap model)throws Exception
	{
		System.out.println("params: "+params);
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();		
		searchVO.setLoginid(loginVO.getUniqId().toString());
		model.addAttribute("logininfo",smarttabletservice.selectlogininfo(searchVO));
		model.addAttribute("autorooms", smartmdmservice.SelectCmmCode("AUTO_ROOM"));
		model.addAttribute("rcptinfo", smartrcptservice.SelectRcptinfo(params.get("takeseq").toString()));
		model.addAttribute("RepairList", smartrcptservice.selectRcptRepairInfo(params.get("takeseq").toString()));
		System.out.println("rcptinfo :"+model.get("rcptinfo"));
		System.out.println("RepairList :"+model.get("RepairList"));
		System.out.println("logininfo :"+model.get("logininfo"));
		System.out.println("autorooms :"+model.get("autorooms"));

		Map<String,Object> leadtimelist = smartmdmservice.selectLeadTime2();
		model.addAttribute("leadtimelist", leadtimelist);
		System.out.println("leadtimelist: "+leadtimelist);
		return "/tablet/TabletAssignView";
	}

	/*
	 * 작업반 배정 업데이트
	 */
	@RequestMapping(value = "/tablet/TabletSaveReceive.do",method=RequestMethod.POST)
	public String TabletSaveReceive(@RequestParam Map<String,Object> params,SmartTabletVO vo,ModelMap model,HttpServletResponse response,RedirectAttributes attr) throws Exception {
		
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		params.put("loginid", id);
		System.out.println(params);

		//접수수정
		int result = smarttabletservice.UpdateAssign(params);
		
		if (result == 0) // insert실패
			attr.addFlashAttribute("msg", "수리사항 데이터가 없습니다. 사이트 제작사에 문의해 주세요");
		else
			attr.addFlashAttribute("msg", "접수 등록되었습니다.");

		return "redirect:/tablet/TabletAssignGroup.do";
	}

	@RequestMapping(value ="/tablet/TabletCompleteView.do")
	public String TabletCompletView(@RequestParam Map<String,Object> params, ModelMap model)throws Exception
	{
		System.out.println("params: "+params);
		model.addAttribute("rcptinfo", smartrcptservice.SelectRcptinfo(params.get("takeseq").toString()));
		model.addAttribute("RepairList", smartrcptservice.selectRcptRepairInfo(params.get("takeseq").toString()));
		System.out.println("rcptinfo :"+model.get("rcptinfo"));
		System.out.println("RepairList :"+model.get("RepairList"));

		Map<String,Object> leadtimelist = smartmdmservice.selectLeadTime2();
		model.addAttribute("leadtimelist", leadtimelist);
		return "/tablet/TabletCompleteView";
	}
}