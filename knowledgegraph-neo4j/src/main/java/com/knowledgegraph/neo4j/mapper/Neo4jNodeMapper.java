package com.knowledgegraph.neo4j.mapper;

import com.knowledgegraph.neo4j.domain.GraphNode;

import java.util.List;

public interface Neo4jNodeMapper {

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
     * 删除节点维护
     *
     * @param graphNodeId 节点维护主键
     * @return 结果
     */
    public int deleteGraphNodeByGraphNodeKey(String graphNodeId);
    public void deleteGraphAllByGraphKey(String graphKey);

    /**
     * 批量删除节点维护
     *
     * @param graphNodeKeys 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGraphNodeByGraphNodeKeys(String[] graphNodeKeys);
}
