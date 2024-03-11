package com.knowledgegraph.neo4j.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.knowledgegraph.neo4j.mapper.Neo4jTestMapper;
import com.knowledgegraph.neo4j.domain.Neo4jTest;
import com.knowledgegraph.neo4j.service.INeo4jTestService;

/**
 * 测试图谱Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-24
 */
@Service
public class Neo4jTestServiceImpl implements INeo4jTestService 
{
    @Autowired
    private Neo4jTestMapper neo4jTestMapper;

    /**
     * 查询测试图谱
     * 
     * @param neo4jTestKey 测试图谱主键
     * @return 测试图谱
     */
    @Override
    public Neo4jTest selectNeo4jTestByNeo4jTestKey(String neo4jTestKey)
    {
        return neo4jTestMapper.selectNeo4jTestByNeo4jTestKey(neo4jTestKey);
    }

    /**
     * 查询测试图谱列表
     * 
     * @param neo4jTest 测试图谱
     * @return 测试图谱
     */
    @Override
    public List<Neo4jTest> selectNeo4jTestList(Neo4jTest neo4jTest)
    {
        return neo4jTestMapper.selectNeo4jTestList(neo4jTest);
    }

    /**
     * 新增测试图谱
     * 
     * @param neo4jTest 测试图谱
     * @return 结果
     */
    @Override
    public int insertNeo4jTest(Neo4jTest neo4jTest)
    {
        return neo4jTestMapper.insertNeo4jTest(neo4jTest);
    }

    /**
     * 修改测试图谱
     * 
     * @param neo4jTest 测试图谱
     * @return 结果
     */
    @Override
    public int updateNeo4jTest(Neo4jTest neo4jTest)
    {
        return neo4jTestMapper.updateNeo4jTest(neo4jTest);
    }

    /**
     * 批量删除测试图谱
     * 
     * @param neo4jTestKeys 需要删除的测试图谱主键
     * @return 结果
     */
    @Override
    public int deleteNeo4jTestByNeo4jTestKeys(String[] neo4jTestKeys)
    {
        return neo4jTestMapper.deleteNeo4jTestByNeo4jTestKeys(neo4jTestKeys);
    }

    /**
     * 删除测试图谱信息
     * 
     * @param neo4jTestKey 测试图谱主键
     * @return 结果
     */
    @Override
    public int deleteNeo4jTestByNeo4jTestKey(String neo4jTestKey)
    {
        return neo4jTestMapper.deleteNeo4jTestByNeo4jTestKey(neo4jTestKey);
    }
}
