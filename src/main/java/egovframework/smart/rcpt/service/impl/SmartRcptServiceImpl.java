package egovframework.smart.rcpt.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	@Override
	public List<Object> SelectMiddleLeadTime(String s) {
		return smartrcptDAO.SelectMiddleLeadTime(s);
	}

	@Override
	@Transactional
	public int InsertWebRcpt(Map<String, Object> params) throws Exception {
		int result=0;
		try{
			if(params.get("position").toString().equals("") == false)
			{
				params.put("taskstat", "CB-standby");
			}

			Map<String, Object> resultmap = smartrcptDAO.InsertWebRcpt(params);
			String takeseq = resultmap.get("takeseq").toString();
			System.out.println(takeseq);
			

			if(takeseq !="")//takeseq가 있다면(성공) 수리사항 등록
			{
				String[] repairlist = params.get("repairlist").toString().split(",");
				String[] repairleadtime = params.get("repairleadtime").toString().split(",");
				String[] chkrepairlist = params.get("chkrepairlist").toString().split(",");
				
				//비어있으면 할당을 안해주면서 out of index 에러나기 때문에 -1옵션을 넣어 null이여도 공백으로 할당해줌
				// String[] notelist = params.get("notelist").toString().split(",",-1);
				// System.out.println("notelist len: "+notelist.length+"notelist :"+notelist);
				//수리항목 등록
				for(int i=0;i<repairlist.length;i++)
				{
					if(repairlist[i]=="" || chkrepairlist[i] == "")
					{
						result =0;
						break;
					}
					Map<String,Object> leadrepairmap = new HashMap<String,Object>();
					leadrepairmap.put("takeseq", takeseq);
					leadrepairmap.put("method", chkrepairlist[i]);
					leadrepairmap.put("code", repairlist[i]);
					leadrepairmap.put("leadtime", repairleadtime[i]);
					// leadrepairmap.put("note", notelist[i]);
					leadrepairmap.put("insertid", params.get("loginid"));
					System.out.println(leadrepairmap);

					result = smartrcptDAO.InsertLeadRepair(leadrepairmap);
					if(result==0)
						break;
				}
			}
		}
		catch(Exception e){
			throw e;
		}
		return result;
	}
	@Override
	public List<Object> SelectRcptList(SmartRcptVO smartrcptVO) throws Exception {
		return smartrcptDAO.SelectRcptList(smartrcptVO);
	}

	@Override
	public int InsertLeadRepair(Map<String, Object> leadrepairmap) throws Exception {
		return smartrcptDAO.InsertLeadRepair(leadrepairmap);
	}

	@Override
	public List<Object> selectRcptRepairInfo(String seq) {
		return smartrcptDAO.selectRcptRepairInfo(seq);
	}

	@Override
	public List<Object> SelectRcptinfo(String seq) throws Exception {
		return smartrcptDAO.SelectRcptinfo(seq);
	}
}
