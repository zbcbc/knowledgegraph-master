package com.knowledgegraph.neo4j.service.impl;

import java.util.List;
import com.knowledgegraph.common.utils.DateUtils;
import com.knowledgegraph.common.utils.SecurityUtils;
import com.knowledgegraph.common.utils.uuid.UUID;
import com.knowledgegraph.neo4j.mapper.Neo4jNodeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.knowledgegraph.neo4j.mapper.GraphNodeMapper;
import com.knowledgegraph.neo4j.domain.GraphNode;
import com.knowledgegraph.neo4j.service.IGraphNodeService;

/**
 * 节点维护Service业务层处理
 * 
 * @author liaoquefei
 * @date 2022-04-10
 */
@Service
public class GraphNodeServiceImpl implements IGraphNodeService 
{
    @Autowired
    private GraphNodeMapper graphNodeMapper;
    @Autowired
    private Neo4jNodeMapper neo4jNodeMapper;
    /**
     * 查询节点维护
     * 
     * @param graphNodeKey 节点维护主键
     * @return 节点维护
     */
    @Override
    public GraphNode selectGraphNodeByGraphNodeKey(String graphNodeKey)
    {
        return graphNodeMapper.selectGraphNodeByGraphNodeKey(graphNodeKey);
    }

    /**
     * 查询节点维护列表
     * 
     * @param graphNode 节点维护
     * @return 节点维护
     */
    @Override
    public List<GraphNode> selectGraphNodeList(GraphNode graphNode)
    {
        return graphNodeMapper.selectGraphNodeList(graphNode);
    }

    /**
     * 新增节点维护
     * 
     * @param graphNode 节点维护
     * @return 结果
     */
    @Override
    public int insertGraphNode(GraphNode graphNode)
    {
        return graphNodeMapper.insertGraphNode(graphNode);
    }

    /**
     * 修改节点维护
     * 
     * @param graphNode 节点维护
     * @return 结果
     */
    @Override
    public int updateGraphNode(GraphNode graphNode)
    {
        graphNode.setUpdateTime(DateUtils.getNowDate());
        return graphNodeMapper.updateGraphNode(graphNode);
    }

    /**
     * 批量删除节点维护
     * 
     * @param graphNodeKeys 需要删除的节点维护主键
     * @return 结果
     */
    @Override
    public int deleteGraphNodeByGraphNodeKeys(String[] graphNodeKeys)
    {
        return graphNodeMapper.deleteGraphNodeByGraphNodeKeys(graphNodeKeys);
    }

    /**
     * 删除节点维护信息
     * 
     * @param graphNodeKey 节点维护主键
     * @return 结果
     */
    @Override
    public int deleteGraphNodeByGraphNodeKey(String graphNodeKey)
    {
        return graphNodeMapper.deleteGraphNodeByGraphNodeKey(graphNodeKey);
    }
}
