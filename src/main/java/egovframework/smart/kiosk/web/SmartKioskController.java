package egovframework.smart.kiosk.web;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.let.cop.com.service.EgovTemplateManageService;
import egovframework.let.cop.com.service.TemplateInfVO;
import egovframework.let.uss.ion.bnr.service.Banner;
import egovframework.let.uss.ion.bnr.service.BannerVO;
import egovframework.let.uss.ion.bnr.service.EgovBannerService;

import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * 배너에 대한 controller 클래스를 정의한다.
 * 배너에 대한 등록, 수정, 삭제, 조회, 반영확인 기능을 제공한다.
 * 배너의 조회기능은 목록조회, 상세조회로 구분된다.
 * @author 공통서비스개발팀 lee.m.j
 * @since 2009.08.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.08.03  lee.m.j        최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */
@Controller
public class SmartKioskController {
	
	@Resource(name = "EgovTemplateManageService")
	private EgovTemplateManageService tmplatService;
	
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Autowired
	private DefaultBeanValidator beanValidator;
	
	/**
	 * MyPage에 배너정보를 제공하기 위해 목록을 조회한다.
	 * @param bannerVO - 배너 VO
	 * @return String - 리턴 URL
	 * @throws Exception
	 */
	@RequestMapping(value = "/kiosk/selectKiosk.do")
	public String selectKiosk(ModelMap model,
			@RequestParam(value = "menuNo", required = false) String menuNo,
			HttpServletRequest request
			) throws Exception {
		// 선택된 메뉴정보를 세션으로 등록한다.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}

		//bannerVO.setBannerList(egovBannerService.selectBannerList(bannerVO));
		//model.addAttribute("bannerList", bannerVO.getBannerList());

		return "/kiosk/SmartKiosk";
	}
	
	@RequestMapping("/kiosk/selectKioskin.do")
	public String selectKioskin(@ModelAttribute("searchVO") TemplateInfVO tmplatInfVO, ModelMap model,
		@RequestParam(value = "menuNo", required = false) String menuNo,
		HttpServletRequest request
		) throws Exception {
		
		// 선택된 메뉴정보를 세션으로 등록한다.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}	

		Map<String, Object> map = tmplatService.selectTemplateInfs(tmplatInfVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("result", null);
		
		return "/kiosk/SmartStandardIn";
	}
	
	@RequestMapping("/kiosk/selectKioskinsurance.do")
	public String selectKioskinsurance(@ModelAttribute("searchVO") TemplateInfVO tmplatInfVO, ModelMap model,
		@RequestParam(value = "menuNo", required = false) String menuNo,
		HttpServletRequest request
		) throws Exception {
		
		// 선택된 메뉴정보를 세션으로 등록한다.
		if (menuNo != null && !menuNo.equals("")) {
			request.getSession().setAttribute("menuNo", menuNo);
		}	

		Map<String, Object> map = tmplatService.selectTemplateInfs(tmplatInfVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("result", null);
		
		return "/kiosk/SmartStandardInsurance";
	}
}
