package com.knowledgegraph.neo4j.service;

import java.util.List;
import com.knowledgegraph.neo4j.domain.Graph;

/**
 * 图谱维护Service接口
 * 
 * @author liaoquefei
 * @date 2022-04-10
 */
public interface IGraphService 
{
    /**
     * 查询图谱维护
     * 
     * @param graphKey 图谱维护主键
     * @return 图谱维护
     */
    public Graph selectGraphByGraphKey(String graphKey);

    /**
     * 查询图谱维护列表
     * 
     * @param graph 图谱维护
     * @return 图谱维护集合
     */
    public List<Graph> selectGraphList(Graph graph);

    public List<Graph> getGraphList(Graph graph);

    /**
     * 根据登陆人查询管理的图谱
     * @param graph
     * @return
     */
    public List<Graph> getListGraphByMember(Graph graph);

    /**
     * 新增图谱维护
     * 
     * @param graph 图谱维护
     * @return 结果
     */
    public int insertGraph(Graph graph);

    /**
     * 修改图谱维护
     * 
     * @param graph 图谱维护
     * @return 结果
     */
    public int updateGraph(Graph graph);



    /**
     * 批量删除图谱维护
     * 
     * @param graphKeys 需要删除的图谱维护主键集合
     * @return 结果
     */
    public int deleteGraphByGraphKeys(String[] graphKeys);

    /**
     * 删除图谱维护信息
     * 
     * @param graphKey 图谱维护主键
     * @return 结果
     */
    public int deleteGraphByGraphKey(String graphKey);
    public int updateGraphViews(String graphKey);
    public int deleteGraphAllByGraphKey(String graphKey);

    /**
     * 根据系统参数查询图谱主键
     * @param configValue
     * @return
     */
    public String findIndexGraphKey(String configValue);

    public List<Graph> getCheckGraphUniquens(Graph graph);
}
