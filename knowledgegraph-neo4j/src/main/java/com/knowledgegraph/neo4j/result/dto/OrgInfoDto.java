package com.knowledgegraph.neo4j.result.dto;

import lombok.Data;

/**
 * ClassName: OrgInfoDto
 * Package: com.knowledgegraph.neo4j.result
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/12 14:45
 * @Version 1.0
 */
@Data
public class OrgInfoDto {

    private long id;

    private String orgName;

    private String orgDec; //机构信息

}
