package com.knowledgegraph.neo4j.service;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserService {

    public List<Map<String,Object>> getTest(@Param("cqlString") String cqlString);
}
