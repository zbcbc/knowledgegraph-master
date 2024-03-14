package com.knowledgegraph.neo4j.result.dto;

import com.knowledgegraph.neo4j.result.vo.OrgExpertVo;
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
public class OrgExpertsDto extends OrgInfoDto {


    List<OrgExpertVo> expertList;


}
