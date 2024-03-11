package com.knowledgegraph.neo4j.service.impl;

import java.util.List;
import com.knowledgegraph.common.utils.DateUtils;
import com.knowledgegraph.common.utils.SecurityUtils;
import com.knowledgegraph.common.utils.uuid.UUID;
import com.knowledgegraph.neo4j.domain.GraphMember;
import com.knowledgegraph.neo4j.mapper.GraphMemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.knowledgegraph.neo4j.mapper.GraphApplyMapper;
import com.knowledgegraph.neo4j.domain.GraphApply;
import com.knowledgegraph.neo4j.service.IGraphApplyService;

/**
 * 申请审核Service业务层处理
 * 
 * @author liaoquefei
 * @date 2022-04-11
 */
@Service
public class GraphApplyServiceImpl implements IGraphApplyService 
{
    @Autowired
    private GraphApplyMapper graphApplyMapper;

    @Autowired
    private GraphMemberMapper graphMemberMapper;

    /**
     * 查询申请审核
     * 
     * @param applyKey 申请审核主键
     * @return 申请审核
     */
    @Override
    public GraphApply selectGraphApplyByApplyKey(String applyKey)
    {
        return graphApplyMapper.selectGraphApplyByApplyKey(applyKey);
    }

    /**
     * 查询申请审核列表
     * 
     * @param graphApply 申请审核
     * @return 申请审核
     */
    @Override
    public List<GraphApply> selectGraphApplyList(GraphApply graphApply)
    {
        return graphApplyMapper.selectGraphApplyList(graphApply);
    }

    /**
     * 新增申请审核
     * 
     * @param graphApply 申请审核
     * @return 结果
     */
    @Override
    public int insertGraphApply(GraphApply graphApply)
    {
        graphApply.setApplyKey(UUID.randomUUID().toString());
        graphApply.setApplyUser(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        graphApply.setApplyTime(DateUtils.getNowDate());
        graphApply.setCreateTime(DateUtils.getNowDate());
        return graphApplyMapper.insertGraphApply(graphApply);
    }

    /**
     * 修改申请审核
     * 
     * @param graphApply 申请审核
     * @return 结果
     */
    @Override
    public int updateGraphApply(GraphApply graphApply)
    {
        graphApply.setExamineTime(DateUtils.getNowDate());
        graphApply.setUpdateTime(DateUtils.getNowDate());
        /**
         * 通过则加入成员表
         */
        if("1".equals(graphApply.getApplyFlag())){
            GraphMember graphMember = new GraphMember();
            graphMember.setGraphMemberKey(UUID.randomUUID().toString());
            graphMember.setGraphMemberType("1");
            graphMember.setGraphKey(graphApply.getGraphKey());
            graphMember.setUserKey(graphApply.getApplyUser());
            graphMember.setJoinTime(DateUtils.getNowDate());
            graphMember.setCreateTime(DateUtils.getNowDate());
            graphMemberMapper.insertGraphMember(graphMember);
        }
        return graphApplyMapper.updateGraphApply(graphApply);
    }

    /**
     * 批量删除申请审核
     * 
     * @param applyKeys 需要删除的申请审核主键
     * @return 结果
     */
    @Override
    public int deleteGraphApplyByApplyKeys(String[] applyKeys)
    {
        return graphApplyMapper.deleteGraphApplyByApplyKeys(applyKeys);
    }

    /**
     * 删除申请审核信息
     * 
     * @param applyKey 申请审核主键
     * @return 结果
     */
    @Override
    public int deleteGraphApplyByApplyKey(String applyKey)
    {
        return graphApplyMapper.deleteGraphApplyByApplyKey(applyKey);
    }
}
