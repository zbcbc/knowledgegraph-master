package com.knowledgegraph.neo4j.mapper;


import java.util.List;
import java.util.Map;

/**
 * 数据统计Mapper接口
 *
 * @author liaoquefei
 * @date 2022-04-18
 */
public interface DataStatisticsMapper {

    public List<Map<String,Object>> selectDataStatisticsUser();
    public List<Map<String,Object>> selectDataStatisticsGraph();
    public List<Map<String,Object>> selectDataStatisticsGraphNode();
    public List<Map<String,Object>> selectDataStatisticsVideo();

}
