package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.Unit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UnitMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Unit record);

    Unit selectByPrimaryKey(Integer id);

    List<Unit> selectAll();

    int updateByPrimaryKey(Unit record);


    List<Unit> getUnits(@Param("unitTypeId") Integer unitTypeId,
                        @Param("unitName") String unitName,
                        @Param("areaId") Integer areaId);

    List<Unit> getUnitsResult(@Param("unitTypeId") Integer unitTypeId,
                              @Param("unitName") String unitName,
                              @Param("areaId") Integer areaId);

    int deleteById(Integer id);

    int deleteByIdList(List<Integer> ids);

}