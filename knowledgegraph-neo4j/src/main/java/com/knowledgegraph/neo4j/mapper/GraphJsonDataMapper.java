package com.knowledgegraph.neo4j.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface GraphJsonDataMapper {

    List<Map<String,Object>> getTest(@Param("cqlString") String cqlString);

//    List<Map<String,Object>> getGraphJsonData(@Param("cqlString") String cqlString);

    List<Map<String,Object>> getTestLink();

    List<Map<String,Object>> getTestNode();

    String addSourceNode(@Param("cqlString") String cqlString);

}
