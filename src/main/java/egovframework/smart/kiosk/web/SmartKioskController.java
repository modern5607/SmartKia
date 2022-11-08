package egovframework.smart.kiosk.web;

import java.util.HashMap;
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
import egovframework.smart.kiosk.service.SmartKioskService;
import egovframework.smart.mdm.service.SmartMdmService;
import egovframework.smart.rcpt.service.SmartRcptService;
import egovframework.smart.rcpt.service.SmartRcptVO;

import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

@Controller
public class SmartKioskController {
	
	@Resource(name = "EgovTemplateManageService")
	private EgovTemplateManageService tmplatService;


	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name = "SmartMdmService")
	private SmartMdmService smartmdmservice;
	
	@Resource(name = "SmartRcptService")
	private SmartRcptService smartrcptservice;

	@Resource(name = "SmartKioskService")
	private SmartKioskService smartkioskservice;

	@Autowired
	private DefaultBeanValidator beanValidator;
	
	@RequestMapping(value = "/kiosk/SmartKiosk.do")
	public String selectKiosk(ModelMap model,@RequestParam(value = "menuNo", required = false) String menuNo,HttpServletRequest request) throws Exception {
		// 선택된 메뉴정보를 세션으로 등록한다.
		// if (menuNo != null && !menuNo.equals("")) {
		// 	request.getSession().setAttribute("menuNo", menuNo);
		// }

		Map<String,Object> leadtimelist = smartmdmservice.selectLeadTime2();
		model.addAttribute("leadtimelist", leadtimelist);


		return "/kiosk/KioskView";
	}

	@RequestMapping(value = "/kiosk/SelectCarInfo.do",method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Object> SelectCarInfo(@RequestParam("carnum") String carnum,@RequestParam("tel") String tel,@RequestParam("mode") String mode, HttpServletResponse response) throws Exception {
		SmartRcptVO smartrcotVO =new SmartRcptVO();
		smartrcotVO.setCheckcarnum(carnum);
		smartrcotVO.setTel(tel);
		smartrcotVO.setMode(mode);
		List<Object> list = smartrcptservice.selectCarInfo2(smartrcotVO);
		System.out.println(list);
		return list;
	}

	//예약 접수 확인
	@RequestMapping(value = "/kiosk/KioskReserveConfirm.do",method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Object> KioskReserveConfirm(@RequestParam("takeseq") String takeseq, HttpServletResponse response) throws Exception {
		return smartrcptservice.KioskReserveConfirm(takeseq);
	}

	//예약 정비내역 조회
	@RequestMapping(value = "/kiosk/SelectReserveCarInfo.do",method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Object> SelectReserveCarInfo(@RequestParam("carnum") String carnum,@RequestParam("tel") String tel, HttpServletResponse response) throws Exception {
		// System.out.println(params.get("selectedvar"));
		SmartRcptVO smartrcotVO =new SmartRcptVO();
		smartrcotVO.setCheckcarnum(carnum);
		smartrcotVO.setTel(tel);
		List<Object> list = smartrcptservice.selectReserveCarInfo(smartrcotVO);
		// List<Object> list = smartrcptservice.SelectMiddleLeadTime(params.get("selectedvar").toString());
		System.out.println("list : "+list);
		// Map<String,Object> map =new HashMap<String,Object>();
		// map.put("list", list);
		return list;
		//response.getWriter().print(map);
	}

	@RequestMapping(value = "/kiosk/SelectCarRepairInfo.do",method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Object> SelectCarRepairInfo(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		System.out.println("id :"+id);
		// SmartRcptVO smartrcotVO =new SmartRcptVO();
		// smartrcotVO.setCheckcarnum(carnum);
		List<Object> list = smartkioskservice.selectCarRepairInfo(id);
		// System.out.println(list);
		return list;
	}


	//키오스크 접수등록
	@RequestMapping(value = "/kiosk/InsertKioskRcpt.do",method = RequestMethod.POST)
	@ResponseBody
	public List<Object> InsertKioskRcpt(@RequestParam Map<String,Object> params,ModelMap model, RedirectAttributes attr) throws Exception {
		
		params.put("loginid", "KioskTest");
		params.put("id", params.get("customerid").toString());
		params.put("servicesys", "CB-Kiosk");

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
		if(result==0)
			return null;
		else
		{
			// Map<String,Object> info = new HashMap<String,Object>();
			// info.put("info",smartrcptservice.Selectrcptinfo(params));
			return smartrcptservice.Selectrcptinfo(params);
		}
			
	}
	


	/*/
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
	*/
}
