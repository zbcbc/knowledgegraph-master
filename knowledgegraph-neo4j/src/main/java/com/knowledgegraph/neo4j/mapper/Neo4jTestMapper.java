package com.knowledgegraph.neo4j.mapper;

import java.util.List;
import com.knowledgegraph.neo4j.domain.Neo4jTest;

/**
 * 测试图谱Mapper接口
 * 
 * @author ruoyi
 * @date 2022-03-24
 */
public interface Neo4jTestMapper 
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
     * 删除测试图谱
     * 
     * @param neo4jTestKey 测试图谱主键
     * @return 结果
     */
    public int deleteNeo4jTestByNeo4jTestKey(String neo4jTestKey);

    /**
     * 批量删除测试图谱
     * 
     * @param neo4jTestKeys 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNeo4jTestByNeo4jTestKeys(String[] neo4jTestKeys);
}
