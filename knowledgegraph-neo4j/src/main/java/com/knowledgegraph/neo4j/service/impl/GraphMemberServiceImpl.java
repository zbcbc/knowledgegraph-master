package com.knowledgegraph.neo4j.service.impl;

import java.util.List;
import com.knowledgegraph.common.utils.DateUtils;
import com.knowledgegraph.common.utils.SecurityUtils;
import com.knowledgegraph.common.utils.uuid.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.knowledgegraph.neo4j.mapper.GraphMemberMapper;
import com.knowledgegraph.neo4j.domain.GraphMember;
import com.knowledgegraph.neo4j.service.IGraphMemberService;

/**
 * 图谱成员维护Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@Service
public class GraphMemberServiceImpl implements IGraphMemberService 
{
    @Autowired
    private GraphMemberMapper graphMemberMapper;

    /**
     * 查询图谱成员维护
     * 
     * @param graphMemberKey 图谱成员维护主键
     * @return 图谱成员维护
     */
    @Override
    public GraphMember selectGraphMemberByGraphMemberKey(String graphMemberKey)
    {
        return graphMemberMapper.selectGraphMemberByGraphMemberKey(graphMemberKey);
    }

    /**
     * 查询图谱成员维护列表
     * 
     * @param graphMember 图谱成员维护
     * @return 图谱成员维护
     */
    @Override
    public List<GraphMember> selectGraphMemberList(GraphMember graphMember)
    {
        return graphMemberMapper.selectGraphMemberList(graphMember);
    }

    /**
     * 新增图谱成员维护
     * 
     * @param graphMember 图谱成员维护
     * @return 结果
     */
    @Override
    public int insertGraphMember(GraphMember graphMember)
    {
        graphMember.setGraphMemberKey(UUID.randomUUID().toString());
        graphMember.setJoinTime(DateUtils.getNowDate());
        graphMember.setCreateTime(DateUtils.getNowDate());
        graphMember.setCreateTime(DateUtils.getNowDate());
        return graphMemberMapper.insertGraphMember(graphMember);
    }

    /**
     * 修改图谱成员维护
     * 
     * @param graphMember 图谱成员维护
     * @return 结果
     */
    @Override
    public int updateGraphMember(GraphMember graphMember)
    {
        graphMember.setUpdateTime(DateUtils.getNowDate());
        return graphMemberMapper.updateGraphMember(graphMember);
    }

    @Override
    public int updateGraphMemberContributionValue(GraphMember graphMember)
    {
        graphMember.setUserKey(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        return graphMemberMapper.updateGraphMember(graphMember);
    }

    /**
     * 批量删除图谱成员维护
     * 
     * @param graphMemberKeys 需要删除的图谱成员维护主键
     * @return 结果
     */
    @Override
    public int deleteGraphMemberByGraphMemberKeys(String[] graphMemberKeys)
    {
        return graphMemberMapper.deleteGraphMemberByGraphMemberKeys(graphMemberKeys);
    }

    /**
     * 删除图谱成员维护信息
     * 
     * @param graphMemberKey 图谱成员维护主键
     * @return 结果
     */
    @Override
    public int deleteGraphMemberByGraphMemberKey(String graphMemberKey)
    {
        return graphMemberMapper.deleteGraphMemberByGraphMemberKey(graphMemberKey);
    }
}
