package com.knowledgegraph.neo4j.result.dto;

import lombok.Data;
import lombok.ToString;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * ClassName: CreateAreaDto
 * Package: com.knowledgegraph.neo4j.result.dto
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/28 13:31
 * @Version 1.0
 */
@Data
@ToString
public class CreateAreaDto {

    private String areaName;
    private Long expertId;
}
