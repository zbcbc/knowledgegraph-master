package com.knowledgegraph.neo4j.service.impl;

import com.knowledgegraph.common.annotation.DataSource;
import com.knowledgegraph.common.enums.DataSourceType;
import com.knowledgegraph.neo4j.mapper.UserMapper;
import com.knowledgegraph.neo4j.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@DataSource(value = DataSourceType.SLAVE)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<Map<String, Object>> getTest(String cqlString) {
        return userMapper.getTest(cqlString);
    }
}
