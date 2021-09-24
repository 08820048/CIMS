package cn.edu.hzvtc.pojo;

import lombok.*;


@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UnitType {
    private Integer id;

    private String unitTypeName;

    private Integer unitTypeSortNum;

    private Integer unitTypeAreaId;

}