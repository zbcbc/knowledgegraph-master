package com.knowledgegraph.neo4j.service;

import java.util.List;
import java.util.Map;

public interface IGraphJsonDataService {

    List<Map<String,Object>> getTestLink();

    List<Map<String,Object>> getTestNode();
}
