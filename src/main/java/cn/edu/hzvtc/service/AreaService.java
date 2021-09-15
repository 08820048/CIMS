package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.AreaMapper;
import cn.edu.hzvtc.pojo.Area;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AreaService {


    @Autowired
    private AreaMapper aserMapper;


    public Area loginArea(int id){
        Area area = aserMapper.selectByPrimaryKey(id);
        return area;

    }
}
