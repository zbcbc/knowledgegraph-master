package com.knowledgegraph.neo4j.result;

import com.knowledgegraph.neo4j.pojo.Expert;
import lombok.Data;

/**
 * ClassName: OrgExpertPo
 * Package: com.knowledgegraph.neo4j.result
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/11 16:13
 * @Version 1.0
 */
@Data
public class OrgExpertPo extends Expert {
    //所属机构名称
    String orgName;
}
