package egovframework.smart.monitoring.web;

import java.util.ArrayList;
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
	 *  현장 작업 현황View
	 */
	@RequestMapping(value = "/monitor/SceneMonitoring.do")
	public String SceneMonitoring(ModelMap model,HttpServletRequest request) throws Exception 
	{
		// service
		model.addAttribute("Guest", smartMonitoringService.GuestMonitoring());

		model.addAttribute("TeamA", smartMonitoringService.SceneMonitoring("CB-A"));
		model.addAttribute("TeamB", smartMonitoringService.SceneMonitoring("CB-B"));
		model.addAttribute("TeamC", smartMonitoringService.SceneMonitoring("CB-C"));
		
		return "/monitor/SceneMonitoring";
	}

	/**
	 *  고객 접수현황
	 */
	@RequestMapping(value = "/monitor/GuestMonitoring.do")
	public String GuestMonitoring(ModelMap model,HttpServletRequest request) throws Exception 
	{
		// service
		
		model.addAttribute("Guest", smartMonitoringService.GuestMonitoring());
		
		model.addAttribute("Team", smartMonitoringService.repairMonitoring());

		model.addAttribute("Complete", smartMonitoringService.CompleteMonitoring());

		return "/monitor/GuestMonitoring";
	}
/*
	@RequestMapping(value = "/monitor/ajaxMonitoring.do",method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Object> ajaxMonitoring(HttpServletResponse response) throws Exception
	{	
		List<Object> list = smartMonitoringService.GetMonitoringData();
		System.out.println(list);

		return list;
	}
 */

	@RequestMapping(value="/monitor/selectRcptmonitor.do",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Object> selectRcptmonitor()throws Exception
	{
		return smartMonitoringService.selectMonitoringList();
	}
	@RequestMapping(value="/monitor/selectTeammonitor.do",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Object> selectTeammonitor()throws Exception
	{
		return smartMonitoringService.selectTeammonitor();
	}
	@RequestMapping(value="/monitor/selectTeammonitorall.do",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Object> selectTeammonitorall()throws Exception
	{
		return smartMonitoringService.repairMonitoring();
	}
	@RequestMapping(value="/monitor/selectCompletemonitor.do",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Object> selectCompletemonitor()throws Exception
	{
		return smartMonitoringService.CompleteMonitoring();
	}
}
