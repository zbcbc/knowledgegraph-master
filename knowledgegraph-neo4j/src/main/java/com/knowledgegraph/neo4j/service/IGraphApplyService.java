package com.knowledgegraph.neo4j.service;

import java.util.List;
import com.knowledgegraph.neo4j.domain.GraphApply;

/**
 * 申请审核Service接口
 * 
 * @author liaoquefei
 * @date 2022-04-11
 */
public interface IGraphApplyService 
{
    /**
     * 查询申请审核
     * 
     * @param applyKey 申请审核主键
     * @return 申请审核
     */
    public GraphApply selectGraphApplyByApplyKey(String applyKey);

    /**
     * 查询申请审核列表
     * 
     * @param graphApply 申请审核
     * @return 申请审核集合
     */
    public List<GraphApply> selectGraphApplyList(GraphApply graphApply);

    /**
     * 新增申请审核
     * 
     * @param graphApply 申请审核
     * @return 结果
     */
    public int insertGraphApply(GraphApply graphApply);

    /**
     * 修改申请审核
     * 
     * @param graphApply 申请审核
     * @return 结果
     */
    public int updateGraphApply(GraphApply graphApply);

    /**
     * 批量删除申请审核
     * 
     * @param applyKeys 需要删除的申请审核主键集合
     * @return 结果
     */
    public int deleteGraphApplyByApplyKeys(String[] applyKeys);

    /**
     * 删除申请审核信息
     * 
     * @param applyKey 申请审核主键
     * @return 结果
     */
    public int deleteGraphApplyByApplyKey(String applyKey);
}
