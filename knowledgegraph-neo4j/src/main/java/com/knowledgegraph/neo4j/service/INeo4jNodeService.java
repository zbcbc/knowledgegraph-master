package com.knowledgegraph.neo4j.service;

import com.knowledgegraph.neo4j.domain.GraphNode;

import java.util.List;

/**
 * Neo4jNodeService接口
 *
 * @author liaoquefei
 * @date 2022-04-11
 */
public interface INeo4jNodeService {
    /**
     * 查询节点维护
     *
     * @param graphNodeKey 节点维护主键
     * @return 节点维护
     */
    public GraphNode selectGraphNodeByGraphNodeKey(String graphNodeKey);

    /**
     * 查询节点维护列表
     *
     * @param graphNode 节点维护
     * @return 节点维护集合
     */
    public List<GraphNode> selectGraphNodeList(GraphNode graphNode);

    /**
     * 新增节点维护
     *
     * @param graphNode 节点维护
     * @return 结果
     */
    public int insertGraphNode(GraphNode graphNode);

    /**
     * 修改节点维护
     *
     * @param graphNode 节点维护
     * @return 结果
     */
    public int updateGraphNode(GraphNode graphNode);

    /**
     * 批量删除节点维护
     *
     * @param graphNodeKeys 需要删除的节点维护主键集合
     * @return 结果
     */
    public int deleteGraphNodeByGraphNodeKeys(String[] graphNodeKeys);

    /**
     * 删除节点维护信息
     *
     * @param graphNodeKey 节点维护主键
     * @return 结果
     */
    public int deleteGraphNodeByGraphNodeKey(String graphNodeKey);
    public void deleteGraphAllByGraphKey(String graphKey);
}
