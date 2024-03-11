package com.knowledgegraph.neo4j.service.impl;

import com.knowledgegraph.common.annotation.DataSource;
import com.knowledgegraph.common.enums.DataSourceType;
import com.knowledgegraph.common.utils.DateUtils;
import com.knowledgegraph.common.utils.SecurityUtils;
import com.knowledgegraph.common.utils.uuid.UUID;
import com.knowledgegraph.neo4j.domain.GraphNode;
import com.knowledgegraph.neo4j.mapper.Neo4jNodeMapper;
import com.knowledgegraph.neo4j.service.INeo4jNodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@DataSource(value = DataSourceType.SLAVE)
public class Neo4jNodeServiceImpl implements INeo4jNodeService {
    
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
        return neo4jNodeMapper.selectGraphNodeByGraphNodeKey(graphNodeKey);
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
        return neo4jNodeMapper.selectGraphNodeList(graphNode);
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
        return neo4jNodeMapper.insertGraphNode(graphNode);
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
        return neo4jNodeMapper.updateGraphNode(graphNode);
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
        return neo4jNodeMapper.deleteGraphNodeByGraphNodeKeys(graphNodeKeys);
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
        return neo4jNodeMapper.deleteGraphNodeByGraphNodeKey(graphNodeKey);
    }

    @Override
    public void deleteGraphAllByGraphKey(String graphKey) {
         neo4jNodeMapper.deleteGraphAllByGraphKey(graphKey);
    }
}
