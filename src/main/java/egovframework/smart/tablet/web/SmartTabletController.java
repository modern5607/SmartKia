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
	
	@Autowired
	private DefaultBeanValidator beanValidator;

	@Resource(name = "EgovBBSAttributeManageService")
	private EgovBBSAttributeManageService bbsAttrbService;

	/**
	 * 입고현황 메인 뷰
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
	
	/**
	 * 입고처리 View
	 */
	@RequestMapping(value = "/tablet/ReceiveWorkgroup.do")
	public String ReceiveWorkgroup(@ModelAttribute("SmartTabletVO") SmartTabletVO searchVO, ModelMap model,
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

		
		System.out.println(searchVO);
		
		// service
		Map<String, Object> map = smarttabletservice.receiveList(searchVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "/tablet/ReceiveWorkgroup";
	}
	
	/**
	 * 작업반 배정 View
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
		/*
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		searchVO.setLoginid(loginVO.getUniqId().toString());
		System.out.println("searchVO :"+searchVO);

		model.addAttribute("logininfo",smarttabletservice.selectlogininfo(searchVO));
		System.out.println("model :"+model);
		System.out.println("TEAM :"+model.get("logininfo").toString());
		//searchVO.setAutoroom("loginfo",model.get("TEAM").toString());
		 */

		// service
		Map<String, Object> map = smarttabletservice.assignmentList(searchVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "/tablet/SmartAssignGroup";
	}
	
	/**
	 *이관 처리 view
	 */
	@RequestMapping(value = "/tablet/TransferWorkGroupPOP.do",method = RequestMethod.GET)
	public String TransferView(@RequestParam String seq,String position,ModelMap model) throws Exception {
		
		SmartCommonCodeVO vo =new SmartCommonCodeVO();
		vo.setGroupcode("AUTO_ROOM");
		
		Map<String,Object> map = smartmdmservice.SelectCommonCode(vo);
		model.addAttribute("positions",map.get("info"));
		model.addAttribute("seq",seq);
		model.addAttribute("position",position);
		System.out.println(map.get("info"));
		System.out.println(model);
		return "/tablet/TransferWorkGroupPOP";
	}
	/**
	 * 이관 처리 Update
	 */
	@RequestMapping(value = "/tablet/Transfergroup.do")
	public String Transfergroup(@RequestParam Map<String,Object> params,SmartTabletVO vo,ModelMap model) throws Exception {
		
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
		int result = smarttabletservice.insertlog(params);
		System.out.println("result : "+ result);
		if(result==0) //log insert 실패 
		{
			model.addAttribute("msg","로그 입력 실패.");
		 	model.addAttribute("url","");
		}
		else {
			int result1 = smarttabletservice.Transfergroup(params);
				if(result1 ==0) //업데이트 실패 
				{
					model.addAttribute("msg","작업반을 확인하여주세요.");
				 	model.addAttribute("url","");
				}
				else {
					model.addAttribute("msg","작업반이 이관되었습니다.");
				 	model.addAttribute("url","SmartWorkGroup.do");
				}
		}
		
		return "alert";
	}
	
	
	@RequestMapping(value = "/tablet/OTWorkGroupPOP.do")
	public String OTGroupView() throws Exception {

		return "/tablet/OTWorkGroupPOP";
	}
	
	@RequestMapping(value = "/tablet/ReceiveGroupPOP.do")
	public String ReceivePopView(@ModelAttribute("SmartTabletVO") SmartTabletVO searchVO, ModelMap model) throws Exception {

		SmartCommonCodeVO vo =new SmartCommonCodeVO();
		vo.setGroupcode("AUTO_ROOM");
		
		Map<String,Object> map = smartmdmservice.SelectCommonCode(vo);
		model.addAttribute("positions",map.get("info"));
		System.out.println(map.get("info"));
		return "/tablet/ReceiveGroupPOP";
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

		System.out.println(searchVO);
		Map<String,Object> map = smarttabletservice.detailList(searchVO);

		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);


		return "/tablet/ProgressDetail";
	}
	
	/**
	 * 작업상태 변경 view
	 */
	@RequestMapping(value = "/tablet/CompletePOP.do",method = RequestMethod.GET)
	public String CompleteView(@RequestParam String taskstat, String seq,ModelMap model) throws Exception {
		
		model.addAttribute("taskstat",taskstat);
		model.addAttribute("seq",seq);
		return "/tablet/CompletePOP";
	}
	
	/**
	 * 작업반 배정 Update
	 */
	@RequestMapping(value = "/tablet/UpdateStatus.do")
	public String UpdateStatus(@RequestParam Map<String,Object> params,SmartTabletVO vo,ModelMap model) throws Exception {
		
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
		System.out.println("vo :"+vo);

		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap = smarttabletservice.checkstatus(params);
		System.out.println("result :"+resultMap);
		
		int result=0;
		if(resultMap.get("TASKSTAT").toString().equals(params.get("taskstat").toString()))
		{
			System.out.println("둘이 같음");
			if(params.get("taskstat").toString().equals("CB-standby")) {
				params.put("update_taskstat", "CB-repaired");
			}
			else if(params.get("taskstat").toString().equals("CB-repaired")) {
				params.put("update_taskstat", "CB-perfect");
			}
			result = smarttabletservice.updatestatus(params);
		}
		
		 if (result == 0) // insert실패
		 {
		 	model.addAttribute("msg","접수상태를 확인하여 주세요.");
		 	model.addAttribute("url","");
		 } else {
		 	model.addAttribute("msg","상태변경이 완료되었습니다.");
		 	model.addAttribute("url","SmartWorkGroup.do");
		 }
		return "alert";
	}
	
	/**
	 * 작업반 배정 Update
	 */
	@RequestMapping(value = "/tablet/UpdateAssignGroup.do")
	public void UpdateAssignGroup(@RequestParam HashMap<String,Object> map,SmartTabletVO vo,HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		String checkboxs = map.get("checkboxs").toString();
		String[] checkarr = checkboxs.split(",");
		vo.setAutoroom(map.get("autoroom").toString());
		vo.setRemark(map.get("remark").toString());
		
		for(int i=0;i<checkarr.length;i++)
		{
			vo.setSeq(checkarr[i]);
			int result = smarttabletservice.updateAssign(vo);
			
			if (result==0){
				
				out.println("<script>");
				out.println("alert('배정에 실패하였습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
			else {
				
				out.println("<script>");
				out.println("alert('배정이 완료되었습니다.')");
				out.println("location.href='/tablet/SmartAssignGroup.do'");
				out.println("</script>");
			}
		}
	}

	/*
	 * 출고화면 View
	 */
	@RequestMapping(value = "/tablet/ReleasePOP.do")
	public String RelasePOPview() throws Exception {

		return "/tablet/ReleasePOP";
	}
	
	@RequestMapping(value = "/tablet/ChangeKilro.do")
	public void ChangeKilro(@RequestParam HashMap<String,Object> map,SmartTabletVO vo,HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		System.out.println("vo : "+vo);
		
	}
}

