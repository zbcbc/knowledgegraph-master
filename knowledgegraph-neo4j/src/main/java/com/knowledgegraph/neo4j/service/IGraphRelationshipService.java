package com.knowledgegraph.neo4j.service;

import java.util.List;
import com.knowledgegraph.neo4j.domain.GraphRelationship;

/**
 * 关系维护Service接口
 * 
 * @author liaoquefei
 * @date 2022-04-11
 */
public interface IGraphRelationshipService 
{
    /**
     * 查询关系维护
     * 
     * @param graphRelationshipId 关系维护主键
     * @return 关系维护
     */
    public GraphRelationship selectGraphRelationshipByGraphRelationshipId(Long graphRelationshipId);

    /**
     * 查询关系维护列表
     * 
     * @param graphRelationship 关系维护
     * @return 关系维护集合
     */
    public List<GraphRelationship> selectGraphRelationshipList(GraphRelationship graphRelationship);
    public int selectGraphRelationshipListTotal(GraphRelationship graphRelationship);
    /**
     * 新增关系维护
     * 
     * @param graphRelationship 关系维护
     * @return 结果
     */
    public int insertGraphRelationship(GraphRelationship graphRelationship);

    /**
     * 修改关系维护
     * 
     * @param graphRelationship 关系维护
     * @return 结果
     */
    public int updateGraphRelationship(GraphRelationship graphRelationship);

    /**
     * 批量删除关系维护
     * 
     * @param graphRelationshipIds 需要删除的关系维护主键集合
     * @return 结果
     */
    public int deleteGraphRelationshipByGraphRelationshipIds(Long[] graphRelationshipIds);

    /**
     * 删除关系维护信息
     * 
     * @param graphRelationshipId 关系维护主键
     * @return 结果
     */
    public int deleteGraphRelationshipByGraphRelationshipId(Long graphRelationshipId);


}
