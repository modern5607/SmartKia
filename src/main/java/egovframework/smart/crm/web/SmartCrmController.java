package egovframework.smart.crm.web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
import egovframework.smart.mdm.service.SmartLeadTimeVO;
import egovframework.smart.mdm.service.SmartMdmBizVO;
import egovframework.smart.mdm.service.SmartMdmService;
import egovframework.let.cop.bbs.service.BoardMasterVO;
import egovframework.let.utl.sim.service.EgovFileScrty;

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
import org.springmodules.validation.commons.DefaultBeanValidator;


@Controller
public class SmartCrmController {
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;
	@Resource(name = "SmartMdmService")
	private SmartMdmService smartmdmservice;
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

    @RequestMapping(value = "/crm/SmartRepairStat.do")
    public String SmartRepairStat(@ModelAttribute("SmartCrmVO") SmartCrmVO SmartCrmVO, ModelMap model,
            @RequestParam(value = "menuNo", required = false) String menuNo,
            HttpServletRequest request) throws Exception {
    
        System.out.println("SmartRepairStat.do -> SmartCrmVO : " + SmartCrmVO);
    
        // 선택된 메뉴정보를 세션으로 등록한다.
        if (menuNo != null && !menuNo.equals("")) {
            request.getSession().setAttribute("menuNo", menuNo);
        }
    
        // 0. Spring Security 사용자권한 처리
//        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//        if (!isAuthenticated) {
//            model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//            return "uat/uia/EgovLoginUsr";
//        }
    
        // // 로그인 객체 선언
        // LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
        // if (loginVO == null) {
        // loginVO = new LoginVO();
        // }
    
        SmartCrmVO.setPageUnit(propertyService.getInt("pageUnit"));
        SmartCrmVO.setPageSize(propertyService.getInt("pageSize"));
    
        PaginationInfo paginationInfo = new PaginationInfo();
    
        paginationInfo.setCurrentPageNo(SmartCrmVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(SmartCrmVO.getPageUnit());
        paginationInfo.setPageSize(SmartCrmVO.getPageSize());
    
        SmartCrmVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        SmartCrmVO.setLastIndex(paginationInfo.getLastRecordIndex());
        SmartCrmVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
    
//        Map<String, Object> map = smartCrmService.dailyrepair(SmartCrmVO);
        Map<String, Object> map = smartCrmService.repairStat(SmartCrmVO);
    
//        System.out.println("test :" + test);
        System.out.println("vo : "+SmartCrmVO);
    
        model.addAttribute("leadtimeVO", SmartCrmVO);
        model.addAttribute("mainlist", map.get("main"));
//        model.addAttribute("middlelist", map.get("middle"));
        System.out.println("main :" + map.get("main"));
//        System.out.println("middle :" + map.get("middle"));
        model.addAttribute("paginationInfo", paginationInfo);
    
        return "/crm/SmartRepairStat";
    }
    @RequestMapping(value = "/crm/SmartRepairInfos.do")
    public String SmartRepairInfos(@ModelAttribute("SmartCrmVO") SmartCrmVO vo, ModelMap model,
            @RequestParam(value = "menuNo", required = false) String menuNo,
            HttpServletRequest request) throws Exception {

          //System.out.println("SmartRepairInfos.do -> =========================== ");
         // System.out.println("SmartRepairInfos.do -> SmartCrmVO : " + vo);
//          System.out.println("SmartLeadTime.do -> callsys : " + callsys);

            // 선택된 메뉴정보를 세션으로 등록한다.
            if (menuNo != null && !menuNo.equals("")) {
                request.getSession().setAttribute("menuNo", menuNo);
            }

            // 0. Spring Security 사용자권한 처리
//            Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
//            if (!isAuthenticated) {
//                model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
//                return "uat/uia/EgovLoginUsr";
//            }

            // // 로그인 객체 선언
            // LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
            // if (loginVO == null) {
            // loginVO = new LoginVO();
            // }

            vo.setPageUnit(propertyService.getInt("pageUnit"));
            vo.setPageSize(propertyService.getInt("pageSize"));

            PaginationInfo paginationInfo = new PaginationInfo();

            paginationInfo.setCurrentPageNo(vo.getPageIndex());
            paginationInfo.setRecordCountPerPage(vo.getPageUnit());
            paginationInfo.setPageSize(vo.getPageSize());

            vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
            vo.setLastIndex(paginationInfo.getLastRecordIndex());
            vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
            System.out.println("vo : "+vo);
//            Map<String, Object> list = smartCrmService.selectCrmList(vo);
            Map<String, Object> map = smartCrmService.selectLeadTime(vo);
            
            //model.addAttribute("selectLeadTime", vo);
            model.addAttribute("leadtimelist", map.get("leadtime"));
            model.addAttribute("mainlist", map.get("main"));
            model.addAttribute("middlelist", map.get("middle"));
            model.addAttribute("paginationInfo", paginationInfo);

            Map<String, Object> list = smartCrmService.selectRepairList(vo);
            model.addAttribute("smartCrmVO", vo);
            model.addAttribute("resultList", list.get("resultList"));
            System.out.println("list.get"+list.get("resultList"));
            model.addAttribute("autorooms", smartmdmservice.SelectCmmCode("AUTO_ROOM"));
            
            return "/crm/SmartRepairInfos";
        }

    @ResponseBody
    @RequestMapping(value = "/crm/SmartRepairAjax.do",method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Object> SmartRepairAjax(@RequestParam Map<String,Object> params, ModelMap model,HttpServletRequest request) throws Exception {

        System.out.println("params: "+params);

        // System.out.println("SmartRepairAjax.do -> =========================== ");
        // System.out.println("SmartRepairAjax.do -> leadtimeVO : " + leadtimeVO);
        // System.out.println("SmartRepairAjax.do -> callsys : " + callsys);

        
        List<Object> list = new ArrayList<>();
        list.add(params);
        list.add(smartCrmService.selectLeadTimelist(params));
        System.out.println("list : "+list);
        // List<Object> test = smartmdmservice.SelectCmmCode("USE_YN");

        return list;
    }
    
}
