package com.knowledgegraph.neo4j.result.dto;

import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * ClassName: CreateExpertDto
 * Package: com.knowledgegraph.neo4j.result.dto
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/27 16:30
 * @Version 1.0
 */
@Data
@ToString
public class CreateExpertDto {

    private String expertName;
    private String expertDeptment;
    private String expertDec;

    //专家所属的机构名称
    private String orgName;
    //专家和机构的合作关系
    private Integer category;

}
