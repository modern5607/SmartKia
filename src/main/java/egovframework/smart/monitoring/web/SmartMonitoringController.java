package egovframework.smart.monitoring.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.let.sec.gmt.service.GroupManage;
import egovframework.let.sec.gmt.service.GroupManageVO;
import egovframework.smart.monitoring.service.SmartMonitoringVO;
import egovframework.smart.monitoring.service.SmartMonitoringService;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
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
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * 설문템플릿 Controller Class 구현
 * 
 * @author 공통서비스 장동한
 * @since 2009.03.20
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.20  장동한          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *      </pre>
 */
@Controller
public class SmartMonitoringController {

	@Autowired
	private DefaultBeanValidator beanValidator;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "SmartMonitoringService")
	private SmartMonitoringService smartMonitoringService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 개별 배포시 메인메뉴를 조회한다.
	 * 
	 * @param model
	 * @return "/uss/sam/cpy/"
	 * @throws Exception
	 */
//	@RequestMapping(value = "/uss/olp/EgovMain.do")
//	public String EgovMain(ModelMap model) throws Exception {
//		return "/uss/olp/qtm/EgovMain";
//	}
//
//	/**
//	 * 메뉴를 조회한다.
//	 * @param model
//	 * @return	"/uss/sam/cpy/EgovLeft"
//	 * @throws Exception
//	 */
//	@RequestMapping(value = "/uss/olp/EgovLeft.do")
//	public String EgovLeft(ModelMap model) throws Exception {
//		return "/uss/olp/qtm/EgovLeft";
//	}

	/**
	 * 설문템플릿 목록을 조회한다.
	 * 
	 * @param searchVO
	 * @param commandMap
	 * @param qustnrTmplatManageVO
	 * @param model
	 * @return "/uss/olp/qtm/EgovQustnrTmplatManageList"
	 * @throws Exception
	 */
	@RequestMapping(value = "/monitor/SmartMonitoring.do")
	public String SmartMonitoring(@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@RequestParam Map<String, Object> commandMap,
			@RequestParam(value = "menuNo", required = false) String menuNo, HttpServletRequest request,
			SmartMonitoringVO smartMonitoringVO, ModelMap model) throws Exception {
		// 선택된 메뉴정보를 세션으로 등록한다.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}

		String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");

		if (sCmd.equals("del")) {
			// egovQustnrTmplatManageService.deleteQustnrTmplatManage(qustnrTmplatManageVO);
		}

		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// model.addAttribute("resultList",
		// SmartMonitoringService.SmartMonitoring(SmartMonitoringVO));

//		model.addAttribute("searchKeyword", commandMap.get("searchKeyword") == null ? "" : (String) commandMap.get("searchKeyword"));
//		model.addAttribute("searchCondition", commandMap.get("searchCondition") == null ? "" : (String) commandMap.get("searchCondition"));

		// int totCnt =
		// egovQustnrTmplatManageService.selectQustnrTmplatManageListCnt(searchVO);
		Map<String, Object> map = smartMonitoringService.selectMonitoringList(searchVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(0);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);

		return "/monitor/SmartMonitoring";
	}

	@RequestMapping(value = "/monitor/SelectSmartMonitoring.do",method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String,Object> SelectSmartMonitoring(@ModelAttribute("searchVO") ComDefaultVO searchVO)throws Exception{
		
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("list", smartMonitoringService.selectMonitoringList(searchVO));
		return map;
	}

	@RequestMapping(value = "/monitor/SmartMonitoringA.do")
	public String SmartMonitoringA(@ModelAttribute("searchVO") ComDefaultVO searchVO, @RequestParam Map<String, Object> commandMap,
			@RequestParam(value = "menuNo", required = false) String menuNo,
			HttpServletRequest request,
			SmartMonitoringVO smartMonitoringVO, ModelMap model) throws Exception {
		// 선택된 메뉴정보를 세션으로 등록한다.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}		
		
		String sCmd = commandMap.get("cmd") == null ? "" : (String) commandMap.get("cmd");

		if (sCmd.equals("del")) {
			//egovQustnrTmplatManageService.deleteQustnrTmplatManage(qustnrTmplatManageVO);
		}

		/** EgovPropertyService.sample */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));


		//model.addAttribute("resultList", egovQustnrTmplatManageService.selectQustnrTmplatManageList(searchVO));

		//model.addAttribute("searchKeyword", commandMap.get("searchKeyword") == null ? "" : (String) commandMap.get("searchKeyword"));
		//model.addAttribute("searchCondition", commandMap.get("searchCondition") == null ? "" : (String) commandMap.get("searchCondition"));
		
		Map<String, Object> map = smartMonitoringService.selectMonitoringList(searchVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));

		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		//int totCnt = egovQustnrTmplatManageService.selectQustnrTmplatManageListCnt(searchVO);

		return "/monitor/SmartMonitoringA";
	}
}
