package cn.edu.hzvtc.service.impl;

import cn.edu.hzvtc.dao.UnitMapper;
import cn.edu.hzvtc.dao.UnitTypeMapper;
import cn.edu.hzvtc.dao.UserUnitMapper;
import cn.edu.hzvtc.pojo.Unit;
import cn.edu.hzvtc.pojo.UnitType;
import cn.edu.hzvtc.service.UnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UnitServiceimpl implements UnitService {
    @Autowired
    private UnitMapper unitMapper;
    @Autowired
    private UnitTypeMapper unitTypeMapper;
    @Autowired
    private UserUnitMapper userUnitMapper;

    @Override
    public void index() {

    }

    @Override
    public List<UnitType> getUnitTypesByAreaId(Integer id) {
        return unitTypeMapper.selectAllByAreaId(id);
    }

    @Override
    public Long getCount(Integer id) {
        return unitTypeMapper.getCount(id);
    }


    @Override
    public Boolean delUnitType(Integer id) {
        return unitTypeMapper.delUnitType(id)>0;
    }

    @Override
    public Boolean addUnitType(UnitType unitType) {
        return unitTypeMapper.addUnitType(unitType)>0;
    }


    @Override
    public UnitType getUnitTypeById(Integer id) {
        return unitTypeMapper.selectByPrimaryKey(id);
    }


    @Override
    public Boolean modifyUnitType(UnitType unitType) {
        return unitTypeMapper.modifyUnitType(unitType) > 0;
    }


    @Override
    public UnitType getUnitTypeName(UnitType unitType) {
        return unitTypeMapper.selectName(unitType);
    }


    @Override
    public List<Unit> getUnits(Integer unitTypeId, String unitName, Integer areaId) {
        unitName = "%" + unitName + "%";
        return unitMapper.getUnitsResult(unitTypeId,unitName,areaId);
    }

    @Override
    public Boolean delUnit(String ids) {
        boolean result = false;
        if (ids.contains("-")) {
            /*批量删除*/
            List<Integer> delIds = new ArrayList<>();
            String[] strIds = ids.split("-");
            for (String strId : strIds) {
                delIds.add(Integer.parseInt(strId));
            }
            if (unitMapper.deleteByIdList(delIds) > 0) {
                userUnitMapper.deleteByUnitIdList(delIds);
                result = true;
            }
        } else {
            /*单一删除*/
            Integer id = Integer.parseInt(ids);
            if (unitMapper.selectByPrimaryKey(id) != null) {
                if (unitMapper.deleteById(id) > 0) {
                    userUnitMapper.deleteByUnitId(id);
                    result = true;
                }
            }
        }
        return result;
    }

    @Override
    public Boolean addUnit(Unit unit) {
        return unitMapper.insert(unit) > 0;
    }

    @Override
    public Unit getUnit(Integer id) {
        return unitMapper.selectByPrimaryKey(id);
    }

    @Override
    public Boolean modifyUnit(Unit unit) {
        return unitMapper.updateByPrimaryKey(unit) > 0;
    }
}
