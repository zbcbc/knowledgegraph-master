package com.knowledgegraph.neo4j.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.knowledgegraph.common.annotation.Excel;
import com.knowledgegraph.common.core.domain.BaseEntity;

/**
 * 节点视频资源对象 graph_node_video
 * 
 * @author liaoquefei
 * @date 2022-04-16
 */
public class GraphNodeVideo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 节点视频资源主键 */
    private String graphNodeVideoKey;

    /** 节点主键 */
    private String graphNodeKey;

    /** 视频简介 */
    @Excel(name = "视频简介")
    private String graphNodeVideoRemark;

    /** 资源链接 */
    @Excel(name = "资源链接")
    private String graphNodeVideoUrl;

    @Excel(name = "创建人")
    private String createName;

    /** $column.columnComment */
    private Date upadteTime;

    public void setGraphNodeVideoKey(String graphNodeVideoKey) 
    {
        this.graphNodeVideoKey = graphNodeVideoKey;
    }

    public String getGraphNodeVideoKey() 
    {
        return graphNodeVideoKey;
    }
    public void setGraphNodeKey(String graphNodeKey) 
    {
        this.graphNodeKey = graphNodeKey;
    }

    public String getGraphNodeKey() 
    {
        return graphNodeKey;
    }
    public void setGraphNodeVideoRemark(String graphNodeVideoRemark) 
    {
        this.graphNodeVideoRemark = graphNodeVideoRemark;
    }

    public String getGraphNodeVideoRemark() 
    {
        return graphNodeVideoRemark;
    }
    public void setGraphNodeVideoUrl(String graphNodeVideoUrl) 
    {
        this.graphNodeVideoUrl = graphNodeVideoUrl;
    }

    public String getGraphNodeVideoUrl() 
    {
        return graphNodeVideoUrl;
    }
    public void setUpadteTime(Date upadteTime) 
    {
        this.upadteTime = upadteTime;
    }

    public Date getUpadteTime() 
    {
        return upadteTime;
    }

    public String getCreateName() {
        return createName;
    }

    public void setCreateName(String createName) {
        this.createName = createName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("graphNodeVideoKey", getGraphNodeVideoKey())
            .append("graphNodeKey", getGraphNodeKey())
            .append("graphNodeVideoRemark", getGraphNodeVideoRemark())
            .append("graphNodeVideoUrl", getGraphNodeVideoUrl())
            .append("createBy", getCreateBy())
            .append("createName", getCreateName())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("upadteTime", getUpadteTime())
            .toString();
    }
}
