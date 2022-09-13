package egovframework.smart.crm.web;

import java.io.PrintWriter;
/*import java.io.PrintWriter;*/
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.smart.crm.service.SmartCrmService;
import egovframework.smart.crm.service.SmartCrmVO;
import egovframework.smart.mdm.mber.service.SmartMberManageService;
import egovframework.smart.mdm.mber.service.SmartMberManageVO;
import egovframework.smart.mdm.mber.service.UserDefaultVO;
import egovframework.smart.mdm.service.SmartMdmBizVO;
import egovframework.let.cop.bbs.service.BoardMasterVO;
import egovframework.let.utl.sim.service.EgovFileScrty;

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
import org.springmodules.validation.commons.DefaultBeanValidator;


@Controller
public class SmartCrmController {
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
	
	@Resource(name = "smartCrmService")
	private SmartCrmService smartCrmService;

	@Autowired
	private DefaultBeanValidator beanValidator;


	@RequestMapping(value = "/crm/SmartAddRepairCar.do")
	public String addRepairCar(@ModelAttribute("SmartCrmVO") SmartCrmVO smartCrmVO, ModelMap model,
			@RequestParam(value = "menuNo", required = false) String menuNo,
			HttpServletRequest request) throws Exception {

		System.out.println("comCodeVO : " + smartCrmVO);
			
		smartCrmVO.setPageUnit(propertyService.getInt("pageUnit"));
		smartCrmVO.setPageSize(propertyService.getInt("pageSize"));
			  
			  PaginationInfo paginationInfo = new PaginationInfo();
			  
			  paginationInfo.setCurrentPageNo(smartCrmVO.getPageIndex());
			  paginationInfo.setRecordCountPerPage(smartCrmVO.getPageUnit());
			  paginationInfo.setPageSize(smartCrmVO.getPageSize());
			  
			  smartCrmVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			  smartCrmVO.setLastIndex(paginationInfo.getLastRecordIndex());
			  smartCrmVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			  
//			  model.addAttribute("resultList", smartCrmService.selectCrmList(smartCrmVO));
			  Map<String, Object> map = smartCrmService.selectCrmList(smartCrmVO);
//			  int totCnt = smartCrmService.selectCrmListTotCnt(smartCrmVO);
			  int totCnt = Integer.parseInt((String) map.get("resultCnt"));
			  paginationInfo.setTotalRecordCount(totCnt);
			  
			  model.addAttribute("smartCrmVO", smartCrmVO);
				model.addAttribute("resultList", map.get("resultList"));
				model.addAttribute("resultCnt", map.get("resultCnt"));
			  model.addAttribute("paginationInfo", paginationInfo);
			
			  System.out.println(smartCrmVO);
			  System.out.println(smartCrmService.selectCrmList(smartCrmVO));
								 
		
		return "/crm/SmartAddRepairCar";
	}


	@RequestMapping("/crm/SmartAddRepairPopup.do")
	public String SmartCrmPopup(@ModelAttribute("searchVO") BoardMasterVO boardMasterVO, ModelMap model,
			@RequestParam(value = "menuNo", required = false) String menuNo,
			HttpServletRequest request
			) throws Exception {

		
	
		return "crm/SmartAddRepairPopup";
	}
}