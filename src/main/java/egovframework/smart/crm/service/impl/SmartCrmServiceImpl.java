package egovframework.smart.crm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.smart.crm.service.SmartCrmService;
import egovframework.smart.crm.service.SmartCrmVO;
import egovframework.smart.mdm.service.SmartLeadTimeVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("smartCrmService")
public class SmartCrmServiceImpl extends EgovAbstractServiceImpl implements SmartCrmService {

	/** SmartCrmDAO */
	@Resource(name="smartCrmDAO")
	private SmartCrmDAO smartCrmDAO;


	@Override
	public  Map<String,Object> selectCrmList(SmartCrmVO vo) throws Exception {
		//System.out.println("impl");
		List<SmartCrmVO> result = smartCrmDAO.selectCrmList(vo);
		//System.out.println("DETAIL : "+detail);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultCnt", cnt);
		return map;
	}


	@Override
	public int selectCrmListTotCnt(SmartCrmVO vo) throws Exception {
		return 0;
	}

    @Override
    public Map<String,Object> dailyrepair(SmartCrmVO vo) throws Exception {
    
        List<SmartCrmVO> dailyhead = smartCrmDAO.dailyhead(vo);
        List<SmartCrmVO> dailydetail = smartCrmDAO.dailydetail(vo);

      System.out.println("dailyhead : "+dailyhead);
      System.out.println("dailydetail : "+ dailydetail);
            
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("dailyhead",dailyhead);
        map.put("dailydetail",dailydetail);
        return map;
    }
    @Override
    public Map<String,Object> selectLeadTime(SmartCrmVO vo) throws Exception {

        List<SmartCrmVO> leadtime = smartCrmDAO.selectLeadTime(vo);
        List<SmartCrmVO> main = smartCrmDAO.selectLeadMain(vo);
        List<SmartCrmVO> middle = smartCrmDAO.selectLeadMiddle(vo);

            
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("leadtime",leadtime);
        map.put("main",main);
        map.put("middle",middle);
        return map;
    }


    @Override
    public List<Object> selectLeadTimelist(Map<String, Object> params) throws Exception {
        return smartCrmDAO.selectLeadTimelist(params);
    }
}