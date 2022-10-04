package egovframework.smart.kiosk.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.smart.kiosk.service.SmartKioskService;

@SuppressWarnings("unchecked")
@Service("SmartKioskService")
public class SmartKioskServiceimpl extends EgovAbstractServiceImpl implements SmartKioskService{

    @Resource(name = "SmartKioskDAO")
    private SmartKioskDAO smartkioskDAO;
    @Override
    public List<Object> selectCarRepairInfo(String id) throws Exception {
        List<Object> repairinfo = smartkioskDAO.selectCarRepairInfo(id);
        System.out.println(repairinfo);
        if(repairinfo == null)
            return null;
        
        // List<Object> repairlist = new ArrayList<>();
        for(int i=0;i<repairinfo.size();i++)
        {
            // repairlist.add(i,repairinfo.get(i));
            String seq = ((HashMap<String,Object>)repairinfo.get(i)).get("TAKESEQ").toString();
            List<Object> detaillist = smartkioskDAO.selectCarRepairDetailInfo(seq);
            ((HashMap<String,Object>)repairinfo.get(i)).put("DETAIL", detaillist);
            
        }
        System.out.println(repairinfo);

        return repairinfo;
    }
    
}
