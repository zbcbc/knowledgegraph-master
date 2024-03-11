package com.knowledgegraph.neo4j.service.impl;

import java.util.List;
import com.knowledgegraph.common.utils.DateUtils;
import com.knowledgegraph.common.utils.SecurityUtils;
import com.knowledgegraph.common.utils.uuid.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.knowledgegraph.neo4j.mapper.GraphNodeVideoMapper;
import com.knowledgegraph.neo4j.domain.GraphNodeVideo;
import com.knowledgegraph.neo4j.service.IGraphNodeVideoService;

/**
 * 节点视频资源Service业务层处理
 * 
 * @author liaoquefei
 * @date 2022-04-16
 */
@Service
public class GraphNodeVideoServiceImpl implements IGraphNodeVideoService 
{
    @Autowired
    private GraphNodeVideoMapper graphNodeVideoMapper;

    /**
     * 查询节点视频资源
     * 
     * @param graphNodeVideoKey 节点视频资源主键
     * @return 节点视频资源
     */
    @Override
    public GraphNodeVideo selectGraphNodeVideoByGraphNodeVideoKey(String graphNodeVideoKey)
    {
        return graphNodeVideoMapper.selectGraphNodeVideoByGraphNodeVideoKey(graphNodeVideoKey);
    }

    /**
     * 查询节点视频资源列表
     * 
     * @param graphNodeVideo 节点视频资源
     * @return 节点视频资源
     */
    @Override
    public List<GraphNodeVideo> selectGraphNodeVideoList(GraphNodeVideo graphNodeVideo)
    {
        return graphNodeVideoMapper.selectGraphNodeVideoList(graphNodeVideo);
    }

    /**
     * 新增节点视频资源
     * 
     * @param graphNodeVideo 节点视频资源
     * @return 结果
     */
    @Override
    public int insertGraphNodeVideo(GraphNodeVideo graphNodeVideo)
    {
        graphNodeVideo.setGraphNodeVideoKey(UUID.randomUUID().toString());
        graphNodeVideo.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        graphNodeVideo.setCreateTime(DateUtils.getNowDate());
        return graphNodeVideoMapper.insertGraphNodeVideo(graphNodeVideo);
    }

    /**
     * 修改节点视频资源
     * 
     * @param graphNodeVideo 节点视频资源
     * @return 结果
     */
    @Override
    public int updateGraphNodeVideo(GraphNodeVideo graphNodeVideo)
    {
        return graphNodeVideoMapper.updateGraphNodeVideo(graphNodeVideo);
    }

    /**
     * 批量删除节点视频资源
     * 
     * @param graphNodeVideoKeys 需要删除的节点视频资源主键
     * @return 结果
     */
    @Override
    public int deleteGraphNodeVideoByGraphNodeVideoKeys(String[] graphNodeVideoKeys)
    {
        return graphNodeVideoMapper.deleteGraphNodeVideoByGraphNodeVideoKeys(graphNodeVideoKeys);
    }

    /**
     * 删除节点视频资源信息
     * 
     * @param graphNodeVideoKey 节点视频资源主键
     * @return 结果
     */
    @Override
    public int deleteGraphNodeVideoByGraphNodeVideoKey(String graphNodeVideoKey)
    {
        return graphNodeVideoMapper.deleteGraphNodeVideoByGraphNodeVideoKey(graphNodeVideoKey);
    }
}
