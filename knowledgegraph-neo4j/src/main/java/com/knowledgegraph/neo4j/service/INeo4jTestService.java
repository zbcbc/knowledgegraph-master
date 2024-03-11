package com.knowledgegraph.neo4j.service;

import java.util.List;
import com.knowledgegraph.neo4j.domain.Neo4jTest;

/**
 * 测试图谱Service接口
 * 
 * @author ruoyi
 * @date 2022-03-24
 */
public interface INeo4jTestService 
{
    /**
     * 查询测试图谱
     * 
     * @param neo4jTestKey 测试图谱主键
     * @return 测试图谱
     */
    public Neo4jTest selectNeo4jTestByNeo4jTestKey(String neo4jTestKey);

    /**
     * 查询测试图谱列表
     * 
     * @param neo4jTest 测试图谱
     * @return 测试图谱集合
     */
    public List<Neo4jTest> selectNeo4jTestList(Neo4jTest neo4jTest);

    /**
     * 新增测试图谱
     * 
     * @param neo4jTest 测试图谱
     * @return 结果
     */
    public int insertNeo4jTest(Neo4jTest neo4jTest);

    /**
     * 修改测试图谱
     * 
     * @param neo4jTest 测试图谱
     * @return 结果
     */
    public int updateNeo4jTest(Neo4jTest neo4jTest);

    /**
     * 批量删除测试图谱
     * 
     * @param neo4jTestKeys 需要删除的测试图谱主键集合
     * @return 结果
     */
    public int deleteNeo4jTestByNeo4jTestKeys(String[] neo4jTestKeys);

    /**
     * 删除测试图谱信息
     * 
     * @param neo4jTestKey 测试图谱主键
     * @return 结果
     */
    public int deleteNeo4jTestByNeo4jTestKey(String neo4jTestKey);
}
