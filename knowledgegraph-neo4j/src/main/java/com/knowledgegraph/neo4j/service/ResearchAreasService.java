package com.knowledgegraph.neo4j.service;

import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.pojo.ResearchAreas;
import com.baomidou.mybatisplus.extension.service.IService;
import com.knowledgegraph.neo4j.result.dto.CreatePaperDto;

/**
* @author zbc
* @description 针对表【research_areas】的数据库操作Service
* @createDate 2024-03-14 11:08:51
*/
public interface ResearchAreasService extends IService<ResearchAreas> {

    AjaxResult createPaperWithExpertAndArea(CreatePaperDto createPaperDto);
}
