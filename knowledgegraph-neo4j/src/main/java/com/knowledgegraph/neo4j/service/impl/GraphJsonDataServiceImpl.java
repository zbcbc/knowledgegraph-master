package com.knowledgegraph.neo4j.service.impl;

import com.knowledgegraph.common.annotation.DataSource;
import com.knowledgegraph.common.enums.DataSourceType;
import com.knowledgegraph.neo4j.mapper.GraphJsonDataMapper;
import com.knowledgegraph.neo4j.service.IGraphJsonDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@DataSource(value = DataSourceType.SLAVE)
public class GraphJsonDataServiceImpl implements IGraphJsonDataService {

    @Autowired
    private GraphJsonDataMapper graphJsonDataMapper;

    @Override
    public List<Map<String, Object>> getTestLink() {
        return graphJsonDataMapper.getTestLink();
    }

    @Override
    public List<Map<String, Object>> getTestNode() {
        return graphJsonDataMapper.getTestNode();
    }
}
