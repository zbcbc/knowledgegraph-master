package com.knowledgegraph.neo4j.service.impl;

import java.util.List;

import com.knowledgegraph.common.utils.DateUtils;
import com.knowledgegraph.common.utils.uuid.IdUtils;
import com.knowledgegraph.common.utils.SecurityUtils;
import com.knowledgegraph.common.utils.uuid.UUID;
import com.knowledgegraph.neo4j.domain.GraphMember;
import com.knowledgegraph.neo4j.mapper.GraphMemberMapper;
import com.knowledgegraph.neo4j.mapper.OrganizationMapper;
import com.knowledgegraph.neo4j.result.OrgExpertsDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.knowledgegraph.neo4j.mapper.GraphMapper;
import com.knowledgegraph.neo4j.domain.Graph;
import com.knowledgegraph.neo4j.service.IGraphService;

/**
 * 图谱维护Service业务层处理
 * 
 * @author liaoquefei
 * @date 2022-04-10
 */
@Service
public class GraphServiceImpl implements IGraphService 
{
    @Autowired
    private GraphMapper graphMapper;

    @Autowired
    private GraphMemberMapper graphMemberMapper;

    @Autowired
    OrganizationServiceImpl os;

    /**
     * 查询图谱维护
     * 
     * @param graphKey 图谱维护主键
     * @return 图谱维护
     */
    @Override
    public Graph selectGraphByGraphKey(String graphKey)
    {
        return graphMapper.selectGraphByGraphKey(graphKey);
    }

    /**
     * 查询图谱维护列表
     * 
     * @param graph 图谱维护
     * @return 图谱维护
     */
    @Override
    public List<Graph> selectGraphList(Graph graph)
    {
        return graphMapper.selectGraphList(graph);
    }

    @Override
    public List<Graph> getGraphList(Graph graph)
    {
        return graphMapper.getGraphList(graph);
    }

    @Override
    public List<Graph> getListGraphByMember(Graph graph) {
        return graphMapper.getListGraphByMember(graph);
    }

    /**
     * 新增图谱维护
     * 
     * @param graph 图谱维护
     * @return 结果
     */
    @Override
    public int insertGraph(Graph graph)
    {
        String graphKey = "id" + IdUtils.fastSimpleUUID().toString();
        graph.setGraphKey(graphKey);
        graph.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        graph.setCreateTime(DateUtils.getNowDate());
        graph.setGraphTime(DateUtils.getNowDate());

        GraphMember graphMember = new GraphMember();
        graphMember.setGraphMemberKey(UUID.randomUUID().toString());
        graphMember.setGraphKey(graphKey);
        graphMember.setContributionValue((long)1);
        graphMember.setUserKey(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        graphMember.setGraphMemberType("0");
        graphMember.setJoinTime(DateUtils.getNowDate());
        graphMember.setCreateTime(DateUtils.getNowDate());
        graphMemberMapper.insertGraphMember(graphMember);


        return graphMapper.insertGraph(graph);
    }

    /**
     * 修改图谱维护
     * 
     * @param graph 图谱维护
     * @return 结果
     */
    @Override
    public int updateGraph(Graph graph)
    {
        graph.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        graph.setUpdateTime(DateUtils.getNowDate());
        return graphMapper.updateGraph(graph);
    }

    /**
     * 批量删除图谱维护
     * 
     * @param graphKeys 需要删除的图谱维护主键
     * @return 结果
     */
    @Override
    public int deleteGraphByGraphKeys(String[] graphKeys)
    {
        return graphMapper.deleteGraphByGraphKeys(graphKeys);
    }

    /**
     * 删除图谱维护信息
     * 
     * @param graphKey 图谱维护主键
     * @return 结果
     */
    @Override
    public int deleteGraphByGraphKey(String graphKey)
    {
        return graphMapper.deleteGraphByGraphKey(graphKey);
    }

    @Override
    public int updateGraphViews(String graphKey) {
        return graphMapper.updateGraphViews(graphKey);
    }

    @Override
    public int deleteGraphAllByGraphKey(String graphKey)
    {
        return graphMapper.deleteGraphAllByGraphKey(graphKey);
    }

    @Override
    public String findIndexGraphKey(String configValue) {
        return graphMapper.findIndexGraphKey(configValue) ;
    }

    @Override
    public List<Graph> getCheckGraphUniquens(Graph graph) {
        return graphMapper.getCheckGraphUniquens(graph);
    }
}
