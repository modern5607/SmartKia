package egovframework.smart.rcpt.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.uss.olh.qna.service.QnaManageVO;
import egovframework.smart.mdm.service.SmartCommonCodeVO;
import egovframework.smart.mdm.service.SmartLeadTimeVO;
import egovframework.smart.mdm.service.SmartMdmBizVO;
import egovframework.smart.mdm.service.SmartMdmService;
import egovframework.smart.rcpt.service.SmartRcptService;

@Service("SmartRcptService")
public class SmartRcptServiceImpl extends EgovAbstractServiceImpl implements SmartRcptService{

	@Resource(name = "SmartRcptDAO")
	private SmartRcptDAO smartrcptDAO;
	
}
