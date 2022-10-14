package egovframework.smart.customer.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.let.uss.umt.service.MberManageVO;
import egovframework.let.uss.umt.service.UserDefaultVO;
import egovframework.let.utl.sim.service.EgovFileScrty;
import egovframework.smart.crm.service.SmartCrmVO;
import egovframework.smart.customer.service.CusMberDefaultVO;
import egovframework.smart.customer.service.CusMberManageService;
import egovframework.smart.customer.service.CusMberManageVO;
import egovframework.smart.mdm.mber.service.SmartMberManageVO;
import egovframework.smart.mdm.service.SmartCommonCodeVO;
import egovframework.smart.mdm.service.SmartLeadTimeVO;
import egovframework.smart.mdm.service.SmartMdmService;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * 일반회원관련 요청을 비지니스 클래스로 전달하고 처리된결과를 해당 웹 화면으로 전달하는 Controller를 정의한다
 * 
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *
 *      </pre>
 */
@Controller
public class SmartCusMberManageController {

	
	@Resource(name = "SmartMdmService")
	private SmartMdmService smartmdmservice;

	/** mberManageService */
	@Resource(name = "cusMberManageService")
	private CusMberManageService cusMberManageService;

	/** cmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;

	/**
	 * 일반회원목록을 조회한다. (pageing)
	 * 
	 * @param userSearchVO 검색조건정보
	 * @param model        화면모델
	 * @return cmm/uss/umt/EgovMberManage
	 * @throws Exception
	 */
	@RequestMapping(value = "/customer/SmartCusMberManage.do")
public String selectCusMberList(@ModelAttribute("userSearchVO") CusMberDefaultVO userSearchVO, ModelMap model,
			HttpServletRequest request, @RequestParam(value = "menuNo", required = false) String menuNo)
			throws Exception {

		// 선택된 메뉴정보를 세션으로 등록한다.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}
		//등록,수정시 메세지
		if (request != null) 
		{
			Map<String,?> flashmap = RequestContextUtils.getInputFlashMap(request);
			if(flashmap != null)
				model.addAttribute("msg",flashmap.get("msg"));
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

		
		model.addAttribute("resultList", cusMberManageService.selectMberList(userSearchVO));	
        System.out.println("resultList"+cusMberManageService.selectMberList(userSearchVO));        	
		int totCnt = cusMberManageService.selectMberListTotCnt(userSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "customer/SmartCusMberManage";
	}

	/**
	 * 일반회원등록화면으로 이동한다.
	 * 
	 * @param userSearchVO 검색조건정보
	 * @param mberManageVO 일반회원초기화정보
	 * @param model        화면모델
	 * @return cmm/uss/umt/EgovMberInsert
	 * @throws Exception
	 */
@RequestMapping("/customer/SmartCusMberInsertView.do")
public String insertMberView(@ModelAttribute("userSearchVO") CusMberDefaultVO userSearchVO,
			@ModelAttribute("cusMberManageVO") CusMberManageVO cusmberManageVO, Model model) throws Exception {

		
	
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "uat/uia/EgovLoginUsr";
    	}
    	
		return "customer/SmartCusMberInsert";
	}


@RequestMapping("/customer/SmartCusMberInsert.do") public String 
insertMber(@ModelAttribute("cusMberManageVO") CusMberManageVO cusMberManageVO,
	  BindingResult bindingResult, Model model, RedirectAttributes attr) throws Exception {
	  
	System.out.println("cusMberManageVO :" +cusMberManageVO);
	
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	    if(!isAuthenticated) {
	    	model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
	        return "uat/uia/EgovLoginUsr";
	    }
	    

	 int result = cusMberManageService.insertMber(cusMberManageVO);
	 //System.out.println(cusMberManageVO);
//	 if(result==1)
//	 {
//		 model.addAttribute("resultMsg", "success.common.insert");
//		 
//	 }
//	 else
//	 {
//		 model.addAttribute("resultMsg", "fail.common.insert");
//	 }
	if (result == 0) // insert실패
	{
			attr.addFlashAttribute("msg","등록에 실패하였습니다.");
	} else {
			attr.addFlashAttribute("msg","성공적으로 등록 되었습니다.");
	}
return "redirect:/customer/SmartCusMberManage.do";
}
	  
	
@RequestMapping("/customer/SmartCusMberSelectUpdtView.do") 
public String updateMberView(@RequestParam("selectedId") String cusId, @ModelAttribute("userSearchVO") CusMberDefaultVO userSearchVO, Model model)
	  throws Exception {
	
	// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
	    	return "uat/uia/EgovLoginUsr";
		}
		
		Map<String,Object> map = new HashMap<String, Object>();

		CusMberManageVO cusMberManageVO = cusMberManageService.selectMber(cusId);
		model.addAttribute("cusMberManageVO", cusMberManageVO);
		model.addAttribute("team",map.get("info"));
//		System.out.println(userSearchVO);
//		System.out.println(cusMberManageVO);
//		System.out.println(cusId);
		return "/customer/SmartCusMberSelectUpdt";
	  }

	  @RequestMapping("/customer/SmartCusMberSelectUpdt.do") public String
	  updateMber(@ModelAttribute("cusMberManageVO") CusMberManageVO cusMberManageVO,
	  BindingResult bindingResult, Model model,HttpServletResponse response, RedirectAttributes attr, @RequestParam Map<String, Object> commandMap) throws Exception {
		  response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			String oldCusNm = (String) commandMap.get("oldCusNm");
			String newCusNm = (String) commandMap.get("newCusNm");
			
			cusMberManageVO.setCusNm(newCusNm);
			cusMberManageVO.setOldCusNm(oldCusNm);
			System.out.println(cusMberManageVO);
		int result = cusMberManageService.updateMber(cusMberManageVO);
		// 미인증 사용자에 대한 보안처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
		    return "uat/uia/EgovLoginUsr";
		}
	  
	  cusMberManageService.updateMber(cusMberManageVO); //Exception 없이 진행시 수정성공메시지
	  model.addAttribute("resultMsg", "success.common.update");
	  if (result == 0) // insert실패
		{
			attr.addFlashAttribute("msg","등록에 실패하였습니다.");
		} else {
			attr.addFlashAttribute("msg","성공적으로 등록 되었습니다.");
		}
	  return "redirect:/customer/SmartCusMberManage.do";
	  }



//	@RequestMapping(value = "mdm/CheckCus.do",method=RequestMethod.POST)
//	@ResponseBody
//	public String checkCus(@ModelAttribute("cusMberManageVO") String cusMberManageVO, @RequestParam("autoNo") String autoNo, @RequestParam("cusNm") String cusNm, ModelMap model, HttpServletResponse response) throws Exception {
//		Map<String,Object> msg = new HashMap<String, Object>();
//
//		System.out.println(msg);
//		System.out.println(cusNm);
//		System.out.println(autoNo);
//
//		int result = cusMberManageService.checkCusDplct(cusNm);
//		/* response.getWriter().print(result); */
//		return Integer.toString(result);
//	}
@RequestMapping(value = "/mdm/searchKindPopupView.do")
public String searchKindPopupView(@ModelAttribute("cusMberManageVO") CusMberManageVO cusMberManageVO,ModelMap model) throws Exception {
	/*
	 * // 미인증 사용자에 대한 보안처리 Boolean isAuthenticated =
	 * EgovUserDetailsHelper.isAuthenticated(); if(!isAuthenticated) {
	 * model.addAttribute("message",
	 * egovMessageSource.getMessage("fail.common.login")); return
	 * "uat/uia/EgovLoginUsr"; }
	 */
	SmartCommonCodeVO vo = new SmartCommonCodeVO();
	vo.setGroupcode("KIND");
	Map<String,Object> map =  smartmdmservice.SelectCommonCode(vo);
	model.addAttribute("kind",map.get("info"));

//	System.out.println("map : "+map.get("info"));

//	System.out.println(vo);
//	System.out.println(cusMberManageVO);
	return "customer/searchKindPopupView";
}

@RequestMapping(value = "/customer/selectCusRepairInfo.do",method = RequestMethod.GET)
public String selectCusRepairInfo(@ModelAttribute("cusMberManageVO") CusMberManageVO cusMberManageVO,ModelMap model, String cusId) throws Exception {      

//    System.out.println(cusId);
    
    model.addAttribute("cusinfo",cusMberManageService.selectCusInfo(cusMberManageVO));
    
//    System.out.println("cusinfo : "+cusMberManageVO);
    return "customer/SmartRepairInfoPopup";
}
@RequestMapping(value = "/customer/selectCusRepairDetail.do",method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
@ResponseBody
public List<Object> selectCusRepairDetail(@RequestParam("seq") String seq, HttpServletResponse response) throws Exception {
    
//    System.out.println("seq :"+seq);
    List<Object> list = cusMberManageService.selectCusDetail(seq);

//    System.out.println("list :"+list);
    return list;
}
}