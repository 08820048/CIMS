package cn.edu.hzvtc.pojo;

public class Area {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_area.id
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_area.area_name
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    private String areaName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_area.area_type
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    private Integer areaType;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_area.area_parent_id
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    private Integer areaParentId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_area.area_sort_num
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    private Integer areaSortNum;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_area.id
     *
     * @return the value of sys_area.id
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_area.id
     *
     * @param id the value for sys_area.id
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_area.area_name
     *
     * @return the value of sys_area.area_name
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    public String getAreaName() {
        return areaName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_area.area_name
     *
     * @param areaName the value for sys_area.area_name
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    public void setAreaName(String areaName) {
        this.areaName = areaName == null ? null : areaName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_area.area_type
     *
     * @return the value of sys_area.area_type
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    public Integer getAreaType() {
        return areaType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_area.area_type
     *
     * @param areaType the value for sys_area.area_type
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    public void setAreaType(Integer areaType) {
        this.areaType = areaType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_area.area_parent_id
     *
     * @return the value of sys_area.area_parent_id
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    public Integer getAreaParentId() {
        return areaParentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_area.area_parent_id
     *
     * @param areaParentId the value for sys_area.area_parent_id
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    public void setAreaParentId(Integer areaParentId) {
        this.areaParentId = areaParentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_area.area_sort_num
     *
     * @return the value of sys_area.area_sort_num
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    public Integer getAreaSortNum() {
        return areaSortNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_area.area_sort_num
     *
     * @param areaSortNum the value for sys_area.area_sort_num
     *
     * @mbg.generated Mon Sep 13 10:19:43 CST 2021
     */
    public void setAreaSortNum(Integer areaSortNum) {
        this.areaSortNum = areaSortNum;
    }
}