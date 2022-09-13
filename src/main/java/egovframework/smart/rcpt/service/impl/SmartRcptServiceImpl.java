package egovframework.smart.rcpt.service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.smart.rcpt.service.SmartRcptService;
import egovframework.smart.rcpt.service.SmartRcptVO;

@Service("SmartRcptService")
public class SmartRcptServiceImpl extends EgovAbstractServiceImpl implements SmartRcptService{

	@Resource(name = "SmartRcptDAO")
	private SmartRcptDAO smartrcptDAO;

	@Override
	public List<?> selectCarInfo(SmartRcptVO vo) throws Exception{
		return smartrcptDAO.selectCarInfo(vo);
	}
	
}
