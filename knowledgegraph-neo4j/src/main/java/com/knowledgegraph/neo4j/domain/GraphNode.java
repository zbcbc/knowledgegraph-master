package com.knowledgegraph.neo4j.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.knowledgegraph.common.annotation.Excel;
import com.knowledgegraph.common.core.domain.BaseEntity;

/**
 * 节点维护对象 graph_node
 * 
 * @author liaoquefei
 * @date 2022-04-10
 */
public class GraphNode extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 图节点主键 */
    private String graphNodeKey;

    /** 图谱主键 */
    @Excel(name = "所属图谱")
    private String graphName;

    private String graphKey;

    /** 节点ID */
    @Excel(name = "节点ID")
    private Long graphNodeId;

    /** 节点名称 */
    @Excel(name = "节点名称")
    private String graphNodeName;

    /** 节点图标 */
    @Excel(name = "节点图标")
    private String graphNodeMyicon;

    /** 节点简介 */
    @Excel(name = "节点简介")
    private String graphNodeRemark;

    /** 维护数 */
    @Excel(name = "维护数")
    private Long graphNodeUpdate;

    /** 节点文档 */
    @Excel(name = "节点文档")
    private String graphNodeUrl;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date graphNodeTime;

    /** $column.columnComment */
    private String deleteFlag;

    public void setGraphNodeKey(String graphNodeKey) 
    {
        this.graphNodeKey = graphNodeKey;
    }

    public String getGraphNodeKey() 
    {
        return graphNodeKey;
    }
    public void setGraphKey(String graphKey) 
    {
        this.graphKey = graphKey;
    }

    public String getGraphKey() 
    {
        return graphKey;
    }
    public void setGraphNodeId(Long graphNodeId) 
    {
        this.graphNodeId = graphNodeId;
    }

    public Long getGraphNodeId() 
    {
        return graphNodeId;
    }
    public void setGraphNodeName(String graphNodeName) 
    {
        this.graphNodeName = graphNodeName;
    }

    public String getGraphNodeName() 
    {
        return graphNodeName;
    }
    public void setGraphNodeMyicon(String graphNodeMyicon) 
    {
        this.graphNodeMyicon = graphNodeMyicon;
    }

    public String getGraphNodeMyicon() 
    {
        return graphNodeMyicon;
    }
    public void setGraphNodeRemark(String graphNodeRemark) 
    {
        this.graphNodeRemark = graphNodeRemark;
    }

    public String getGraphNodeRemark() 
    {
        return graphNodeRemark;
    }
    public void setGraphNodeUpdate(Long graphNodeUpdate) 
    {
        this.graphNodeUpdate = graphNodeUpdate;
    }

    public Long getGraphNodeUpdate() 
    {
        return graphNodeUpdate;
    }
    public void setGraphNodeUrl(String graphNodeUrl) 
    {
        this.graphNodeUrl = graphNodeUrl;
    }

    public String getGraphNodeUrl() 
    {
        return graphNodeUrl;
    }
    public void setGraphNodeTime(Date graphNodeTime) 
    {
        this.graphNodeTime = graphNodeTime;
    }

    public Date getGraphNodeTime() 
    {
        return graphNodeTime;
    }
    public void setDeleteFlag(String deleteFlag) 
    {
        this.deleteFlag = deleteFlag;
    }

    public String getDeleteFlag() 
    {
        return deleteFlag;
    }

    public String getGraphName() {
        return graphName;
    }

    public void setGraphName(String graphName) {
        this.graphName = graphName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("graphNodeKey", getGraphNodeKey())
            .append("graphKey", getGraphKey())
            .append("graphName", getGraphName())
            .append("graphNodeId", getGraphNodeId())
            .append("graphNodeName", getGraphNodeName())
            .append("graphNodeMyicon", getGraphNodeMyicon())
            .append("graphNodeRemark", getGraphNodeRemark())
            .append("graphNodeUpdate", getGraphNodeUpdate())
            .append("graphNodeUrl", getGraphNodeUrl())
            .append("graphNodeTime", getGraphNodeTime())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("deleteFlag", getDeleteFlag())
            .toString();
    }
}
