package com.knowledgegraph.neo4j.mapper;

import com.knowledgegraph.neo4j.pojo.ResearchAreas;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.knowledgegraph.neo4j.result.dto.AreaPapersDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author zbc
* @description 针对表【research_areas】的数据库操作Mapper
* @createDate 2024-03-14 11:08:51
* @Entity com.knowledgegraph.neo4j.pojo.ResearchAreas
*/
public interface ResearchAreasMapper extends BaseMapper<ResearchAreas> {
    List<AreaPapersDto> queryAreasByExpertId(@Param("expertId")Long expertId);
}




