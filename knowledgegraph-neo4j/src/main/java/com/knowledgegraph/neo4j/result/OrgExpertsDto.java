package com.knowledgegraph.neo4j.result;

import com.knowledgegraph.neo4j.pojo.Expert;
import com.knowledgegraph.neo4j.pojo.Organization;
import lombok.Data;

import java.util.List;

/**
 * ClassName: OrgExpertsDto
 * Package: com.knowledgegraph.neo4j.result
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/6 14:47
 * @Version 1.0
 */
@Data
public class OrgExpertsDto extends Organization {
    List<OrgExpertPo> expertList;


}
