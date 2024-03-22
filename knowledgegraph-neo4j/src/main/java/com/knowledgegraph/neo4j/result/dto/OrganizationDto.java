package com.knowledgegraph.neo4j.result.dto;

import lombok.Data;
import lombok.ToString;

/**
 * ClassName: OrganizationDto
 * Package: com.knowledgegraph.neo4j.result.dto
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/22 13:41
 * @Version 1.0
 */
@Data
@ToString
public class OrganizationDto {
    private long id;
    private String orgName;

    private String orgDec; //机构信息
}
