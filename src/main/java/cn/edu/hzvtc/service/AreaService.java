package cn.edu.hzvtc.service;

import cn.edu.hzvtc.pojo.Area;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface AreaService {

    /**
     * 获取地域信息
     * @return 树结构信息
     */
    List<Area> getAreaList();

    /**
     * 插入操作
     */
    void insert();


    void index();

    List<Area> getTree(int parentId);

    int addSchool(Area area);

    int updateSchool(Area area);

     Long getCount(Integer type);
}
