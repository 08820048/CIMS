package cn.edu.hzvtc.service.impl;

import cn.edu.hzvtc.dao.AreaMapper;
import cn.edu.hzvtc.pojo.Area;
import cn.edu.hzvtc.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AreaServiceImpl implements AreaService {

    @Autowired
    private AreaMapper areaMapper;

    @Override
    public List<Area> getAreaList() {

        return null;
    }

    @Override
    public void insert() {
        System.out.println("123");
    }

    @Override
    public void index() {

    }

    @Override
    public List<Area> getTree(int parentId) {
        return areaMapper.selectAllForTree(parentId);
    }

    @Override
    public int addSchool(Area area) {
        //System.out.println("调试-->服务实现中的insert结果:"+areaMapper.insert(area));
        return areaMapper.insert(area);
    }

    @Override
    public int updateSchool(Area area) {
        return areaMapper.updateByPrimaryKey(area);
    }

    @Override
    public Long getCount(Integer type) {
        return areaMapper.getCount(type);
    }
}
