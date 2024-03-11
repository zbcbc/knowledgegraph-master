package com.knowledgegraph.neo4j.service;

import java.util.List;
import com.knowledgegraph.neo4j.domain.GraphMember;

/**
 * 图谱成员维护Service接口
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public interface IGraphMemberService 
{
    /**
     * 查询图谱成员维护
     * 
     * @param graphMemberKey 图谱成员维护主键
     * @return 图谱成员维护
     */
    public GraphMember selectGraphMemberByGraphMemberKey(String graphMemberKey);

    /**
     * 查询图谱成员维护列表
     * 
     * @param graphMember 图谱成员维护
     * @return 图谱成员维护集合
     */
    public List<GraphMember> selectGraphMemberList(GraphMember graphMember);

    /**
     * 新增图谱成员维护
     * 
     * @param graphMember 图谱成员维护
     * @return 结果
     */
    public int insertGraphMember(GraphMember graphMember);

    /**
     * 修改图谱成员维护
     * 
     * @param graphMember 图谱成员维护
     * @return 结果
     */
    public int updateGraphMember(GraphMember graphMember);
    public int updateGraphMemberContributionValue(GraphMember graphMember);

    /**
     * 批量删除图谱成员维护
     * 
     * @param graphMemberKeys 需要删除的图谱成员维护主键集合
     * @return 结果
     */
    public int deleteGraphMemberByGraphMemberKeys(String[] graphMemberKeys);

    /**
     * 删除图谱成员维护信息
     * 
     * @param graphMemberKey 图谱成员维护主键
     * @return 结果
     */
    public int deleteGraphMemberByGraphMemberKey(String graphMemberKey);
}
