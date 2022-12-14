package egovframework.smart.mdm.web;

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

import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
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

	@Resource(name = "SmartMdmService")
	private SmartMdmService smartmdmservice;

	@Autowired
	private DefaultBeanValidator beanValidator;

	@Resource(name = "EgovBBSAttributeManageService")
	private EgovBBSAttributeManageService bbsAttrbService;

	@RequestMapping(value = "/mdm/SmartCode.do")
	public String selectCode(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model,
			@RequestParam(value = "menuNo", required = false) String menuNo,
			HttpServletRequest request) throws Exception {

		if(request!=null)
		{
			Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
			if(flashmap != null)
				model.addAttribute("msg",flashmap.get("msg"));
		}
		System.out.println("comCodeVO : " + comCodeVO);
		// ????????? ??????????????? ???????????? ????????????.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}

		// 0. Spring Security ??????????????? ??????
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		// // ????????? ?????? ??????
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
		// System.out.println("Map :" + map);
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

	// -------------------???????????? ?????? --------------------------------
	// ?????????????????? ?????? ???
	@RequestMapping(value = "/mdm/InsertCommonGroupCodeView.do")
	public String InsertCommonGroupCodeView(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model,HttpServletRequest request) throws Exception {
		
		// ????????? ???????????? ?????? ????????????
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		return "mdm/InsertCommonGroupCodeView";
	}

	// ?????????????????? ??????
	@RequestMapping(value = "/mdm/InsertCommonGroupCode.do")
	public String InsertCommonGroupCode(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model,RedirectAttributes attr,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		comCodeVO.setCurrentid(id);

		System.out.println("GC : " + comCodeVO.getGroupcode());
		System.out.println("GNm : " + comCodeVO.getGroupname());

		int result = smartmdmservice.InsertCommonGroupCode(comCodeVO);
		if (result == 0) // insert??????
		{
			attr.addFlashAttribute("msg", "?????? ??????, ???????????? ??? ?????? ????????? ?????????");
		}
		else{
			attr.addFlashAttribute("msg", "??????????????? ?????????????????????");

		}
		
		return "redirect:/mdm/SmartCode.do";
	}

	// ?????????????????? ?????? ???
	@RequestMapping(value = "mdm/UpdateCommonGroupCodeView.do")

	public String UpdateCommonGroupCodeView(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model) throws Exception {

		Map<String, Object> info = smartmdmservice.SelectCommonGroupCode(comCodeVO);
		System.out.println("info : " + info.get("info"));

		model.addAttribute("info", info.get("info"));
		model.addAttribute("previousgroupcode", comCodeVO.getGroupcode());
		return "mdm/UpdateCommonGroupCodeView";
	}

	// ?????????????????? ??????
	@RequestMapping(value = "mdm/UpdateCommonGroupCode.do")
	public String UpdateCommonGroupCode(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model,RedirectAttributes attr,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		comCodeVO.setCurrentid(id);
		System.out.println(comCodeVO);

		int result = smartmdmservice.UpdateCommonGroupCode(comCodeVO);

		if (result == 0) // insert??????
		{
			attr.addFlashAttribute("msg", "?????? ??????, ???????????? ??? ?????? ????????? ?????????");
		}
		else{
			attr.addFlashAttribute("msg", "??????????????? ?????????????????????");

		}
		return "redirect:/mdm/SmartCode.do";
	}

	// -------------------???????????? ?????? --------------------------------
	// ???????????? ?????? ???
	@RequestMapping(value = "/mdm/InsertCommonCodeView.do")
	public String InsertCommonCodeView(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model)
			throws Exception {
		// ????????? ???????????? ?????? ????????????
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}
		System.out.println(comCodeVO);
		// ???????????? ?????????????????????

		// ?????? attribute ??????
		model.addAttribute("comCodeVO", comCodeVO);

		return "mdm/InsertCommonCodeView";
	}

	// ???????????? ??????
	@RequestMapping(value = "/mdm/InsertCommonCode.do")
	public String InsertCommonCode(@ModelAttribute("comCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model,RedirectAttributes attr,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		comCodeVO.setCurrentid(id);

		System.out.println("GroupCode : " + comCodeVO.getGroupcode());
		System.out.println("Code : " + comCodeVO.getCode());
		System.out.println("CodeNm : " + comCodeVO.getName());

		int result = smartmdmservice.InsertCommonCode(comCodeVO);
		if (result == 0) // insert??????
		{
			attr.addFlashAttribute("msg", "?????? ??????, ???????????? ??? ?????? ????????? ?????????");
		}
		else{
			attr.addFlashAttribute("msg", "??????????????? ?????????????????????");

		}
		return "redirect:/mdm/SmartCode.do";
	}

	// ???????????? ?????? ???
	@RequestMapping(value = "mdm/UpdateCommonCodeView.do")
	public String UpdateCommonCodeView(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model)
			throws Exception {
		System.out.println(comCodeVO);
		// Map<String, Object> info = smartmdmservice.SelectCommonCode(comCodeVO);
		List<Object> info = smartmdmservice.SelectCode(comCodeVO.getGroupcode(), comCodeVO.getCode());
		// System.out.println("info : "+info);
		model.addAttribute("info", info);
		System.out.println("info : "+model.get("info"));
		// model.addAttribute("previousgroupcode",comCodeVO.getGroupcode());
		return "mdm/UpdateCommonCodeView";
	}

	// ???????????? ??????
	@RequestMapping(value = "mdm/UpdateCommonCode.do")
	public String UpdateCommonCode(@ModelAttribute("SmartCommonCodeVO") SmartCommonCodeVO comCodeVO, ModelMap model,RedirectAttributes attr,
	HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();

		System.out.println(comCodeVO);

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		comCodeVO.setCurrentid(id);

		int result = smartmdmservice.UpdateCommonCode(comCodeVO);
		if (result == 0) // insert??????
		{
			attr.addFlashAttribute("msg", "?????? ??????, ???????????? ??? ?????? ????????? ?????????");
		}
		else{
			attr.addFlashAttribute("msg", "??????????????? ?????????????????????");

		}
		return "redirect:/mdm/SmartCode.do";
	}



	// ---------------??????????????????-----------
	@RequestMapping(value = "/mdm/SmartLeadTime.do")
	public String SmartLeadTime(@ModelAttribute("SmartLeadTimeVO") SmartLeadTimeVO leadtimeVO, ModelMap model,
			@RequestParam(value = "menuNo", required = false) String menuNo, @RequestParam(value = "callsys", required = false) String callsys,
			HttpServletRequest request) throws Exception {
		if(request!=null)
		{
			Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
			if(flashmap != null)
				model.addAttribute("msg",flashmap.get("msg"));
		}
		// ????????? ??????????????? ???????????? ????????????.

		// 0. Spring Security ??????????????? ??????
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if (!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "uat/uia/EgovLoginUsr";
		}

		// // ????????? ?????? ??????
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
		List<Object> useyn = smartmdmservice.SelectCmmCode("USE_YN");

		// System.out.println("test :" + test);

		model.addAttribute("useyn", useyn);
		model.addAttribute("leadtimeVO", leadtimeVO);
		model.addAttribute("leadtimelist", map.get("leadtime"));
		model.addAttribute("mainlist", map.get("main"));
		model.addAttribute("middlelist", map.get("middle"));
		model.addAttribute("sublist", map.get("sub"));
		model.addAttribute("paginationInfo", paginationInfo);
		
        return "/mdm/SmartLeadTimeView";
    }

	@RequestMapping(value = "/mdm/InsertGroupLeadTime.do")
	public String InsertGroupLeadTime(@ModelAttribute("SmartLeadTimeVO") SmartLeadTimeVO leadtimeVO, ModelMap model, HttpServletResponse response,RedirectAttributes attr) throws Exception {

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		leadtimeVO.setId(id);
		System.out.println(leadtimeVO);
		int result = smartmdmservice.InsertGroupLeadTime(leadtimeVO);
		System.out.println("result :"+result);
		if (result == 0) // insert??????
			attr.addFlashAttribute("msg", "?????? ??????, ???????????? ??? ?????? ????????? ?????????");
		else
			attr.addFlashAttribute("msg", "?????????????????????");

		return "redirect:/mdm/SmartLeadTime.do";
	}
	
	@RequestMapping(value = "/mdm/UpdateGroupLeadTime.do")
	public String UpdateGroupLeadTime(@ModelAttribute("SmartLeadTimeVO") SmartLeadTimeVO leadtimeVO, HttpServletResponse response,RedirectAttributes attr) throws Exception {
		response.setContentType("text/html; charset=euc-kr");

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		leadtimeVO.setId(id);
		
		System.out.println("UpdateGroupLeadTime : "+leadtimeVO);
		

		int result = smartmdmservice.UpdateGroupLeadTime(leadtimeVO);
		System.out.println(result);
		if (result == 0) // insert??????
			attr.addFlashAttribute("msg", "?????? ??????, ???????????? ??? ?????? ????????? ?????????");
		else
			attr.addFlashAttribute("msg", "?????????????????????");

		return "redirect:/mdm/SmartLeadTime.do";
	}

	@RequestMapping(value = "/mdm/InsertLeadTime.do",method=RequestMethod.POST)
	public String InsertLeadTime(@ModelAttribute("SmartLeadTimeVO") SmartLeadTimeVO leadtimeVO, ModelMap model, HttpServletResponse response,RedirectAttributes attr) throws Exception {
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		leadtimeVO.setId(id);

		System.out.println("InsertLeadTime.do -> leadtimeVO : "+leadtimeVO);


		int result = smartmdmservice.InsertLeadTime(leadtimeVO);
		if (result == 0) // insert??????
			attr.addFlashAttribute("msg", "?????? ??????, ???????????? ??? ?????? ????????? ?????????");
		else
			attr.addFlashAttribute("msg", "?????????????????????");

		return "redirect:/mdm/SmartLeadTime.do";
	}

	@RequestMapping(value = "/mdm/UpdateLeadTime.do")
	public String UpdateLeadTime(@ModelAttribute("SmartLeadTimeVO") SmartLeadTimeVO leadtimeVO, HttpServletResponse response,RedirectAttributes attr) throws Exception {
		response.setContentType("text/html; charset=euc-kr");

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		leadtimeVO.setId(id);
		
		System.out.println("leadtimeVO : "+leadtimeVO);
		

		int result = smartmdmservice.UpdateLeadTime(leadtimeVO);
		System.out.println(result);
		if (result == 0) // insert??????
			attr.addFlashAttribute("msg", "?????? ??????, ???????????? ??? ?????? ????????? ?????????");
		else
			attr.addFlashAttribute("msg", "?????????????????????");

		return "redirect:/mdm/SmartLeadTime.do";
	}

	/**
	 * ????????? ?????? ??????
	 */
	@RequestMapping(value = "/mdm/SmartBiz.do")
	public String selectBiz(@ModelAttribute("SmartMdmBizVO") SmartMdmBizVO searchVO, ModelMap model,
			@RequestParam(value = "menuNo", required = false) String menuNo,
			HttpServletRequest request) throws Exception {
		if(request!=null)
		{
			Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
			if(flashmap != null)
				model.addAttribute("msg",flashmap.get("msg"));
		}

		// ????????? ??????????????? ???????????? ????????????.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}

		// 0. Spring Security ??????????????? ??????
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
		System.out.println("Map: " + map);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);

		return "/mdm/SmartBiz";
	}

	/**
	 * ????????? ?????? ????????????
	 */
	@RequestMapping(value = "/mdm/SmartaddBiz.do")
	public String SmartaddBiz(@ModelAttribute("SmartMdmBizVO") SmartMdmBizVO smartmdmbizVO, Model model) throws Exception {
		
		SmartCommonCodeVO vo = new SmartCommonCodeVO(); 
		vo.setGroupcode("AUTO_000");
		System.out.println(vo);

		Map<String,Object> map = smartmdmservice.SelectCommonCode(vo);
		model.addAttribute("itemcode",map.get("info"));
		System.out.println(map.get("info"));
		//??????????????????????????? ????????????????????? ??????
		//vo.setGroupcode("AUTO_000");
		//model.addAttribute("passwordHint_result", smartmdmservice.selectCmmCodeDetail(vo));

		return "/mdm/SmartAddBiz";
	}

	/**
	 * ????????? ?????? ??????
	 */

	@RequestMapping(value = "/mdm/InsertSmartaddBiz.do")
	public String InsertSmartaddBiz(@ModelAttribute("SmartMdmBizVO") SmartMdmBizVO smartmdmbizVO,
			ModelMap model, HttpServletResponse response, RedirectAttributes attr) throws Exception {
		response.setContentType("text/html; charset=euc-kr");

		int result = smartmdmservice.insertaddBiz(smartmdmbizVO);
		if (result == 0) // insert??????
			attr.addFlashAttribute("msg", "?????? ??????, ???????????? ??? ?????? ????????? ?????????");
		else
			attr.addFlashAttribute("msg", "?????????????????????");

		return "redirect:/mdm/SmartBiz.do";
	}
	
	/**
	 * ?????? ?????? ?????? View
	 */
	@RequestMapping(value = "/mdm/SmartChkcodeview.do")
	public String checkbizcode(ModelMap model) throws Exception {

		System.out.println(model);
		model.addAttribute("checkId", "");
		model.addAttribute("usedCnt", "-1");
		return "/mdm/SmartChkcode";
	}

	/**
	 * ???????????? ??????
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

	// ??????????????? ?????? ???
	@RequestMapping(value = "/mdm/SmartUpdateBizView.do")
	public String UpdateBizView(@ModelAttribute("SmartMdmBizVO") SmartMdmBizVO SmartMdmBizVO, ModelMap model) throws Exception {
		
		SmartCommonCodeVO vo = new SmartCommonCodeVO(); 
		vo.setGroupcode("AUTO_000");

		Map<String,Object> map = smartmdmservice.SelectCommonCode(vo);
		model.addAttribute("itemcode",map.get("info"));
		
		Map<String,Object> info = smartmdmservice.SelectCommonCustid(SmartMdmBizVO);
		
		model.addAttribute("bizinfo", info.get("info"));
		model.addAttribute("UdateBiz",SmartMdmBizVO.getCustid());
		
		return "/mdm/SmartUpdateBiz";
	}

	// ??????????????? ??????
	@RequestMapping(value = "mdm/SmartUpdateBiz.do")
	public String UpdateBiz(@ModelAttribute("SmartMdmBizVO") SmartMdmBizVO SmartMdmBizVO, ModelMap model,HttpServletResponse response, RedirectAttributes attr) throws Exception {
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		/*LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		String id = loginVO.getUniqId();
		SmartMdmBizVO.setCurrentid(id);
		System.out.println(SmartMdmBizVO); 
		*/
		System.out.println(SmartMdmBizVO);
		
		int result = smartmdmservice.UpdateBiz(SmartMdmBizVO);
		if (result == 0) // insert??????
			attr.addFlashAttribute("msg", "?????? ??????, ???????????? ??? ?????? ????????? ?????????");
		else
			attr.addFlashAttribute("msg", "?????????????????????");

		return "redirect:/mdm/SmartBiz.do";
	}
}
