package com.knowledgegraph.neo4j.mapper;

import java.util.List;
import com.knowledgegraph.neo4j.domain.Graph;

/**
 * 图谱维护Mapper接口
 * 
 * @author liaoquefei
 * @date 2022-04-10
 */
public interface GraphMapper 
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
     * 删除图谱维护
     * 
     * @param graphKey 图谱维护主键
     * @return 结果
     */
    public int deleteGraphByGraphKey(String graphKey);
    public int updateGraphViews(String graphKey);
    public int deleteGraphAllByGraphKey(String graphKey);

    /**
     * 批量删除图谱维护
     * 
     * @param graphKeys 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGraphByGraphKeys(String[] graphKeys);

    public List<Graph> getListGraphByMember(Graph graph);

    public String findIndexGraphKey(String configValue);

    public List<Graph> getCheckGraphUniquens(Graph graph);
}
