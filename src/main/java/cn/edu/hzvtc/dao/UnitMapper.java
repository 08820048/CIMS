package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.pojo.Unit;
import java.util.List;

public interface UnitMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table unit_info
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table unit_info
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    int insert(Unit record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table unit_info
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    Unit selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table unit_info
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    List<Unit> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table unit_info
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    int updateByPrimaryKey(Unit record);
}