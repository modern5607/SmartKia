package egovframework.smart.tablet.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.let.uss.olh.qna.service.QnaManageVO;
import egovframework.smart.mdm.service.SmartCommonCodeVO;
import egovframework.smart.mdm.service.SmartLeadTimeVO;
import egovframework.smart.mdm.service.SmartMdmBizVO;
import egovframework.smart.mdm.service.SmartMdmService;
import egovframework.smart.rcpt.service.impl.SmartRcptDAO;
import egovframework.smart.tablet.service.SmartTabletService;
import egovframework.smart.tablet.service.SmartTabletVO;


@Service("SmartTabletService")
public class SmartTabletServiceImpl extends EgovAbstractServiceImpl implements SmartTabletService{

	@Resource(name = "SmartTabletDAO")
	private SmartTabletDAO SmartTabletDAO;

	@Resource(name = "SmartRcptDAO")
	private SmartRcptDAO smartrcptDAO;

	@Override
	public Map<String, Object> selectList(SmartTabletVO vo) throws Exception {
		
		List<SmartTabletVO> result = SmartTabletDAO.selectList(vo);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultCnt", cnt);
		return map;
	}

	@Override
	public Map<String, Object> assignmentList(SmartTabletVO vo) throws Exception {
		List<SmartTabletVO> result = SmartTabletDAO.assignmentList(vo);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultCnt", cnt);
		return map;
	}

	@Override
	public int updatestatus(Map<String, Object> params) {
		return SmartTabletDAO.updatestatus(params);
	}

	@Override
	public Map<String, Object> detailList(SmartTabletVO vo) {
		List<SmartTabletVO> result = SmartTabletDAO.detailList(vo);
		String cnt = Integer.toString(result.size());

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("resultList", result);
		map.put("resultCnt", cnt);
		return map;
	}

	@Override
	public List<Object> selectlogininfo(SmartTabletVO searchVO) {
		return SmartTabletDAO.selectlogininfo(searchVO);
	}

	@Override
	public List<Object> selectcarlist(String seq) {
		return SmartTabletDAO.selectcarlist(seq);
	}

	@Override
	@Transactional
	public int UpdateAssign(Map<String, Object> params)throws Exception {
		int result=0;



		String[] deletelist =params.get("deletelist").toString().split(",",-1);
		
		String[] repairlist =params.get("repairlist").toString().split(",");
		String[] repairseqlist = new String[repairlist.length];
		repairseqlist = params.get("repairseqlist").toString().split(",",-1);
		// String[] repair_notelist = params.get("repair_notelist").toString().split(",",-1);
		// String[] notelist = params.get("repairnote").toString().split(",",-1);
		String[] chkrepairlist = params.get("chkrepairlist").toString().split(",");
		// String[] repairantlist = params.get("repairantlist").toString().split(",");

		for(int i=0;i<repairseqlist.length;i++)
			System.out.println(i+" :"+repairseqlist[i]+", ");
		try{
		//접수 수정
		result = SmartTabletDAO.UpdateAssign(params);
		System.out.println("UpdateAssign"+result);
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
		System.out.println("repairlist.length:"+repairlist.length);
		System.out.println("repairseqlist.length:"+repairseqlist.length);
		for(int i=0;i<repairlist.length;i++)
		{
			if(repairlist[i]=="" || chkrepairlist[i] == "")
			{
				result =0;
				throw new Exception("실패, 수리 사항이 없거나 종류리스트에 데이터 없음");
				// break;
			}
			Map<String,Object> repairParams = new HashMap<String,Object>();
			//수정할게 있으면
			if(repairseqlist.length > i && repairseqlist[i]!="")
			{
				//UPDATE
				repairParams.put("repairseq", params.get("repairseq"));
				repairParams.put("takeseq", params.get("seq"));
				repairParams.put("method", chkrepairlist[i]);
				repairParams.put("code", repairlist[i]);
				// repairParams.put("repairant", repairantlist[i]);
				// repairParams.put("repair_note", repair_notelist[i]);
				repairParams.put("loginid", params.get("loginid"));
				// System.out.println("repairParams:"+repairParams);

				result = smartrcptDAO.UpdateRepair(repairParams);

				System.out.println("UPDATE : "+result);
				if(result==0)
					throw new Exception("수리 수정 실패");
				
			}
			else
			{
				//INSERT
				repairParams.put("takeseq", params.get("seq"));
				repairParams.put("method", chkrepairlist[i]);
				repairParams.put("code", repairlist[i]);
				// repairParams.put("repairant", repairantlist[i]);
				// repairParams.put("note", repair_notelist[i]);
				repairParams.put("loginid", params.get("loginid"));
				// System.out.println("repairParams:"+repairParams);
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

	@Override
	public int cancelreceive(Map<String, Object> params) throws Exception {
		return SmartTabletDAO.cancelreceive(params);
	}

	@Override
	@Transactional
	public int RepairComplete(Map<String, Object> params) throws Exception {
		int result=0;



		String[] deletelist =params.get("deletelist").toString().split(",",-1);
		
		String[] repairlist =params.get("repairlist").toString().split(",");
		String[] repairseqlist = new String[repairlist.length];
		repairseqlist = params.get("repairseqlist").toString().split(",",-1);
		// String[] repair_notelist = params.get("repair_notelist").toString().split(",",-1);
		// String[] notelist = params.get("repairnote").toString().split(",",-1);
		String[] chkrepairlist = params.get("chkrepairlist").toString().split(",");
		// String[] repairantlist = params.get("repairantlist").toString().split(",");

		for(int i=0;i<repairseqlist.length;i++)
			System.out.println(i+" :"+repairseqlist[i]+", ");
		try{
		//수리 완료
		result = SmartTabletDAO.RepairComplete(params);
		if(result==0)
			throw new Exception("완료 처리 실패");
		// 주행거리 업데이트
		result = SmartTabletDAO.updatekilro(params);
			if(result==0)
			throw new Exception("주행거리 업데이트 실패");
		
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
		System.out.println("repairlist.length:"+repairlist.length);
		System.out.println("repairseqlist.length:"+repairseqlist.length);
		for(int i=0;i<repairlist.length;i++)
		{
			if(repairlist[i]=="" || chkrepairlist[i] == "")
			{
				result =0;
				break;
			}
			Map<String,Object> repairParams = new HashMap<String,Object>();
			//수정할게 있으면
			if(repairseqlist.length > i && repairseqlist[i]!="")
			{
				//UPDATE
				repairParams.put("repairseq", params.get("repairseq"));
				repairParams.put("takeseq", params.get("seq"));
				repairParams.put("method", chkrepairlist[i]);
				repairParams.put("code", repairlist[i]);
				// repairParams.put("repairant", repairantlist[i]);
				// repairParams.put("repair_note", repair_notelist[i]);
				repairParams.put("loginid", params.get("loginid"));
				// System.out.println("repairParams:"+repairParams);

				result = smartrcptDAO.UpdateRepair(repairParams);

				System.out.println("UPDATE : "+result);
				if(result==0)
					throw new Exception("수리 수정 실패");
				
			}
			else
			{
				//INSERT
				repairParams.put("takeseq", params.get("seq"));
				repairParams.put("method", chkrepairlist[i]);
				repairParams.put("code", repairlist[i]);
				// repairParams.put("repairant", repairantlist[i]);
				// repairParams.put("note", repair_notelist[i]);
				repairParams.put("loginid", params.get("loginid"));
				// System.out.println("repairParams:"+repairParams);
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

	@Override
	@Transactional
	public int ReleaseRepair(Map<String, Object> params) throws Exception {
		int result=0;



		String[] deletelist =params.get("deletelist").toString().split(",",-1);
		
		String[] repairlist =params.get("repairlist").toString().split(",");
		String[] repairseqlist = new String[repairlist.length];
		repairseqlist = params.get("repairseqlist").toString().split(",",-1);
		// String[] repair_notelist = params.get("repair_notelist").toString().split(",",-1);
		// String[] notelist = params.get("repairnote").toString().split(",",-1);
		String[] chkrepairlist = params.get("chkrepairlist").toString().split(",");
		// String[] repairantlist = params.get("repairantlist").toString().split(",");

		for(int i=0;i<repairseqlist.length;i++)
			System.out.println(i+" :"+repairseqlist[i]+", ");
		try{
		//출고처리
		result = SmartTabletDAO.ReleaseRepair(params);
		if(result==0)
			throw new Exception("출고 처리 실패");
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
		System.out.println("repairlist.length:"+repairlist.length);
		System.out.println("repairseqlist.length:"+repairseqlist.length);
		for(int i=0;i<repairlist.length;i++)
		{
			if(repairlist[i]=="" || chkrepairlist[i] == "")
			{
				result =0;
				break;
			}
			Map<String,Object> repairParams = new HashMap<String,Object>();
			//수정할게 있으면
			if(repairseqlist.length > i && repairseqlist[i]!="")
			{
				//UPDATE
				repairParams.put("repairseq", params.get("repairseq"));
				repairParams.put("takeseq", params.get("seq"));
				repairParams.put("method", chkrepairlist[i]);
				repairParams.put("code", repairlist[i]);
				// repairParams.put("repairant", repairantlist[i]);
				// repairParams.put("repair_note", repair_notelist[i]);
				repairParams.put("loginid", params.get("loginid"));
				// System.out.println("repairParams:"+repairParams);

				result = smartrcptDAO.UpdateRepair(repairParams);

				System.out.println("UPDATE : "+result);
				if(result==0)
					throw new Exception("수리 수정 실패");
				
			}
			else
			{
				//INSERT
				repairParams.put("takeseq", params.get("seq"));
				repairParams.put("method", chkrepairlist[i]);
				repairParams.put("code", repairlist[i]);
				// repairParams.put("repairant", repairantlist[i]);
				// repairParams.put("note", repair_notelist[i]);
				repairParams.put("loginid", params.get("loginid"));
				// System.out.println("repairParams:"+repairParams);
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
