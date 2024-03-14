package com.knowledgegraph.neo4j.result.vo;

import com.knowledgegraph.neo4j.pojo.Expert;
import com.knowledgegraph.neo4j.result.dto.AreaPapersDto;
import lombok.Data;

import java.util.List;

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
public class OrgExpertVo extends Expert {
    //所属机构名称
    String orgName;

    //与该机构的合作关系名
    String relationshipName;

    //与该机构的合作关系分类
    Integer relationshipCategory;

    //该专家的研究方向
    List<AreaPapersDto> areasList;
}
