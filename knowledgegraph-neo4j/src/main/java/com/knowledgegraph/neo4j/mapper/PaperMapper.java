package com.knowledgegraph.neo4j.mapper;

import com.knowledgegraph.neo4j.pojo.Paper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* @author zbc
* @description 针对表【paper】的数据库操作Mapper
* @createDate 2024-03-14 11:08:51
* @Entity com.knowledgegraph.neo4j.pojo.Paper
*/
public interface PaperMapper extends BaseMapper<Paper> {
    List<Paper> queryPaperByExpertIdAndAreaId(@Param("expertId")Long expertId, @Param("areaId") Long areaId);
}




