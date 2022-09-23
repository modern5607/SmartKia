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
				params.put("taskstat", "CB-standby");
			else
				params.put("taskstat", "CB-receipt");

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
					leadrepairmap.put("repairant", 'Y');
					leadrepairmap.put("leadtime", repairleadtime[i]);
					// leadrepairmap.put("note", notelist[i]);
					leadrepairmap.put("loginid", params.get("loginid"));
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

	@Override
	@Transactional
	public int UpdateRepair(Map<String, Object> params) throws Exception {
		int result=0;



		String[] deletelist =params.get("deletelist").toString().split(",",-1);
		
		String[] repairlist =params.get("repairlist").toString().split(",");
		String[] repairseqlist =params.get("repairseqlist").toString().split(",",-1);
		String[] repair_notelist = params.get("repair_notelist").toString().split(",",-1);
		// String[] notelist = params.get("repairnote").toString().split(",",-1);
		String[] chkrepairlist = params.get("chkrepairlist").toString().split(",");
		String[] repairantlist = params.get("repairantlist").toString().split(",");

		try{
		//접수 수정
		result = smartrcptDAO.UpdateRcpt(params);
		if(result==0)
			throw new Exception("접수 수정 실패");
		
		//DELETE
		if(deletelist.length>0)
		{
			System.out.println("DELETE len: "+deletelist.length);
			for(int i=0;i<deletelist.length;i++)
			{
				
				System.out.println("DELETE 내용: "+deletelist[i]);
				if(deletelist[i]==null || deletelist[i]=="")
					continue;

				Map<String,Object> deleteParams = new HashMap<String,Object>();
				deleteParams.put("takeseq", params.get("seq"));
				deleteParams.put("repairseq", deletelist[i]);
				result = smartrcptDAO.DeleteRepair(deleteParams);
				System.out.println("DELETE : "+result);
				if(result==0)
					throw new Exception("수리 삭제 실패");
			}
		}

		for(int i=0;i<repairlist.length;i++)
		{
			if(repairlist[i]=="" || chkrepairlist[i] == "")
			{
				result =0;
				break;
			}
			Map<String,Object> repairParams = new HashMap<String,Object>();
			//UPDATE
			if(repairseqlist[i] != "")
			{
				
				repairParams.put("repairseq", params.get("repairseq"));
				repairParams.put("takeseq", params.get("seq"));
				repairParams.put("method", chkrepairlist[i]);
				repairParams.put("code", repairlist[i]);
				repairParams.put("repairant", repairantlist[i]);
				repairParams.put("repair_note", repair_notelist[i]);
				repairParams.put("loginid", params.get("loginid"));
				System.out.println("repairParams:"+repairParams);
				result = smartrcptDAO.UpdateRepair(repairParams);
				System.out.println("UPDATE : "+result);
				if(result==0)
					throw new Exception("수리 수정 실패");
			}
			//INSERT
			else
			{
				repairParams.put("takeseq", params.get("seq"));
				repairParams.put("method", chkrepairlist[i]);
				repairParams.put("code", repairlist[i]);
				repairParams.put("repairant", repairantlist[i]);
				repairParams.put("note", repair_notelist[i]);
				repairParams.put("loginid", params.get("loginid"));
				System.out.println("repairParams:"+repairParams);
				result = smartrcptDAO.InsertLeadRepair(repairParams);
				System.out.println("INSERT : "+result);
				if(result==0)
					throw new Exception("접수 등록 실패");
			}
		}
		// List<Object> selectinfo = smartrcptDAO.selectRepairInfo(params);

		}
		catch(Exception e){
			throw e;
		}
		// System.out.println("selectinfo :" +selectinfo);

		return result;
	}
}
