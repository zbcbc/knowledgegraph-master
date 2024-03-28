package com.knowledgegraph.neo4j.result.dto;

import lombok.Data;
import lombok.ToString;

/**
 * ClassName: CreatePaperDto
 * Package: com.knowledgegraph.neo4j.result.dto
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/28 14:00
 * @Version 1.0
 */
@Data
@ToString
public class CreatePaperDto {
    //论文信息
    private String title;

    private Long publicationYear;

    private String conferenceJournal;

    //论文所属研究方向id
    private Long areaId;

    //论文所属专家id
    private Long expertId;
}
