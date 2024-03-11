package com.knowledgegraph.neo4j.service.impl;

import java.util.List;

import com.knowledgegraph.common.annotation.DataSource;
import com.knowledgegraph.common.enums.DataSourceType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.knowledgegraph.neo4j.mapper.GraphRelationshipMapper;
import com.knowledgegraph.neo4j.domain.GraphRelationship;
import com.knowledgegraph.neo4j.service.IGraphRelationshipService;

/**
 * 关系维护Service业务层处理
 * 
 * @author liaoquefei
 * @date 2022-04-11
 */
@Service
@DataSource(value = DataSourceType.SLAVE)
public class GraphRelationshipServiceImpl implements IGraphRelationshipService 
{
    @Autowired
    private GraphRelationshipMapper graphRelationshipMapper;

    /**
     * 查询关系维护
     * 
     * @param graphRelationshipId 关系维护主键
     * @return 关系维护
     */
    @Override
    public GraphRelationship selectGraphRelationshipByGraphRelationshipId(Long graphRelationshipId)
    {
        return graphRelationshipMapper.selectGraphRelationshipByGraphRelationshipId(graphRelationshipId);
    }

    /**
     * 查询关系维护列表
     * 
     * @param graphRelationship 关系维护
     * @return 关系维护
     */
    @Override
    public List<GraphRelationship> selectGraphRelationshipList(GraphRelationship graphRelationship)
    {
        return graphRelationshipMapper.selectGraphRelationshipList(graphRelationship);
    }

    @Override
    public int selectGraphRelationshipListTotal(GraphRelationship graphRelationship) {
        return  graphRelationshipMapper.selectGraphRelationshipListTotal(graphRelationship);
    }

    /**
     * 新增关系维护
     * 
     * @param graphRelationship 关系维护
     * @return 结果
     */
    @Override
    public int insertGraphRelationship(GraphRelationship graphRelationship)
    {
        return graphRelationshipMapper.insertGraphRelationship(graphRelationship);
    }

    /**
     * 修改关系维护
     * 
     * @param graphRelationship 关系维护
     * @return 结果
     */
    @Override
    public int updateGraphRelationship(GraphRelationship graphRelationship)
    {
        return graphRelationshipMapper.updateGraphRelationship(graphRelationship);
    }

    /**
     * 批量删除关系维护
     * 
     * @param graphRelationshipIds 需要删除的关系维护主键
     * @return 结果
     */
    @Override
    public int deleteGraphRelationshipByGraphRelationshipIds(Long[] graphRelationshipIds)
    {
         graphRelationshipMapper.deleteGraphRelationshipByGraphRelationshipIds(graphRelationshipIds);
        return 1;
    }

    /**
     * 删除关系维护信息
     * 
     * @param graphRelationshipId 关系维护主键
     * @return 结果
     */
    @Override
    public int deleteGraphRelationshipByGraphRelationshipId(Long graphRelationshipId)
    {
         graphRelationshipMapper.deleteGraphRelationshipByGraphRelationshipId(graphRelationshipId);
        return 1;
    }
}
