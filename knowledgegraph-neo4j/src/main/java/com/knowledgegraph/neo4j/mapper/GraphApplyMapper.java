package com.knowledgegraph.neo4j.mapper;

import java.util.List;
import com.knowledgegraph.neo4j.domain.GraphApply;

/**
 * 申请审核Mapper接口
 * 
 * @author liaoquefei
 * @date 2022-04-11
 */
public interface GraphApplyMapper 
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
     * 删除申请审核
     * 
     * @param applyKey 申请审核主键
     * @return 结果
     */
    public int deleteGraphApplyByApplyKey(String applyKey);

    /**
     * 批量删除申请审核
     * 
     * @param applyKeys 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGraphApplyByApplyKeys(String[] applyKeys);
}
