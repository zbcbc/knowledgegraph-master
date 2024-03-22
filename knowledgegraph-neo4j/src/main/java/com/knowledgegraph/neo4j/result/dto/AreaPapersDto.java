package com.knowledgegraph.neo4j.result.dto;

import com.knowledgegraph.neo4j.pojo.Paper;
import com.knowledgegraph.neo4j.pojo.ResearchAreas;
import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * ClassName: AreaPapersVo
 * Package: com.knowledgegraph.neo4j.result.vo
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/14 13:23
 * @Version 1.0
 */
@Data
@ToString
public class AreaPapersDto extends ResearchAreas {
    //该方向所属教授id
    //Long expertId;

    //该方向下的论文
    List<Paper> paperList;
}
