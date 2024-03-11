package com.knowledgegraph.neo4j.service;

import java.util.List;
import com.knowledgegraph.neo4j.domain.GraphNodeVideo;

/**
 * 节点视频资源Service接口
 * 
 * @author liaoquefei
 * @date 2022-04-16
 */
public interface IGraphNodeVideoService 
{
    /**
     * 查询节点视频资源
     * 
     * @param graphNodeVideoKey 节点视频资源主键
     * @return 节点视频资源
     */
    public GraphNodeVideo selectGraphNodeVideoByGraphNodeVideoKey(String graphNodeVideoKey);

    /**
     * 查询节点视频资源列表
     * 
     * @param graphNodeVideo 节点视频资源
     * @return 节点视频资源集合
     */
    public List<GraphNodeVideo> selectGraphNodeVideoList(GraphNodeVideo graphNodeVideo);

    /**
     * 新增节点视频资源
     * 
     * @param graphNodeVideo 节点视频资源
     * @return 结果
     */
    public int insertGraphNodeVideo(GraphNodeVideo graphNodeVideo);

    /**
     * 修改节点视频资源
     * 
     * @param graphNodeVideo 节点视频资源
     * @return 结果
     */
    public int updateGraphNodeVideo(GraphNodeVideo graphNodeVideo);

    /**
     * 批量删除节点视频资源
     * 
     * @param graphNodeVideoKeys 需要删除的节点视频资源主键集合
     * @return 结果
     */
    public int deleteGraphNodeVideoByGraphNodeVideoKeys(String[] graphNodeVideoKeys);

    /**
     * 删除节点视频资源信息
     * 
     * @param graphNodeVideoKey 节点视频资源主键
     * @return 结果
     */
    public int deleteGraphNodeVideoByGraphNodeVideoKey(String graphNodeVideoKey);
}
