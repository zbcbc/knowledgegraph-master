package com.knowledgegraph.neo4j.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.knowledgegraph.common.annotation.Excel;
import com.knowledgegraph.common.core.domain.BaseEntity;

/**
 * 关系维护对象 graph_relationship
 * 
 * @author liaoquefei
 * @date 2022-04-11
 */
public class GraphRelationship extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 关系ID */
    @Excel(name = "关系ID")
    private Long graphRelationshipId;

    /** 图主键 */
    private String graphKey;

    /** 关系名称 */
    @Excel(name = "关系名称")
    private String graphRelationshipName;

    /** 始节点ID */
    @Excel(name = "始节点ID")
    private Long graphRelationshipFrom;

    /** 始节点名称 */
    @Excel(name = "始节点名称")
    private String graphRelationshipFromName;

    /** 终节点ID */
    @Excel(name = "终节点ID")
    private Long graphRelationshipTo;

    /** 终节点名称 */
    @Excel(name = "终节点名称")
    private String graphRelationshipToName;

    private Long pageNumNeo4j;

    private Long pageSizeNeo4j;

    private Long skip;

    private String limitFlag;



    public void setGraphRelationshipId(Long graphRelationshipId)
    {
        this.graphRelationshipId = graphRelationshipId;
    }

    public Long getGraphRelationshipId() 
    {
        return graphRelationshipId;
    }
    public void setGraphKey(String graphKey) 
    {
        this.graphKey = graphKey;
    }

    public String getGraphKey() 
    {
        return graphKey;
    }
    public void setGraphRelationshipName(String graphRelationshipName) 
    {
        this.graphRelationshipName = graphRelationshipName;
    }

    public String getGraphRelationshipName() 
    {
        return graphRelationshipName;
    }
    public void setGraphRelationshipFrom(Long graphRelationshipFrom) 
    {
        this.graphRelationshipFrom = graphRelationshipFrom;
    }

    public Long getGraphRelationshipFrom() 
    {
        return graphRelationshipFrom;
    }
    public void setGraphRelationshipFromName(String graphRelationshipFromName) 
    {
        this.graphRelationshipFromName = graphRelationshipFromName;
    }

    public String getGraphRelationshipFromName() 
    {
        return graphRelationshipFromName;
    }
    public void setGraphRelationshipTo(Long graphRelationshipTo) 
    {
        this.graphRelationshipTo = graphRelationshipTo;
    }

    public Long getGraphRelationshipTo() 
    {
        return graphRelationshipTo;
    }
    public void setGraphRelationshipToName(String graphRelationshipToName) 
    {
        this.graphRelationshipToName = graphRelationshipToName;
    }

    public String getGraphRelationshipToName() 
    {
        return graphRelationshipToName;
    }

    public Long getPageNumNeo4j() {
        return pageNumNeo4j;
    }

    public void setPageNumNeo4j(Long pageNumNeo4j) {
        this.pageNumNeo4j = pageNumNeo4j;
    }

    public Long getPageSizeNeo4j() {
        return pageSizeNeo4j;
    }

    public void setPageSizeNeo4j(Long pageSizeNeo4j) {
        this.pageSizeNeo4j = pageSizeNeo4j;
    }
    public Long getSkip() {
        return skip;
    }

    public void setSkip(Long pageNum,Long pageSize) {
        this.skip = (pageNum - 1)*pageSize;
    }

    public String getLimitFlag() {
        return limitFlag;
    }

    public void setLimitFlag(String limitFlag) {
        this.limitFlag = limitFlag;
    }

    public void startPage() {
        this.limitFlag = "1";
        this.skip = (this.pageNumNeo4j - 1) * this.pageSizeNeo4j;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("graphRelationshipId", getGraphRelationshipId())
            .append("graphKey", getGraphKey())
            .append("graphRelationshipName", getGraphRelationshipName())
            .append("graphRelationshipFrom", getGraphRelationshipFrom())
            .append("graphRelationshipFromName", getGraphRelationshipFromName())
            .append("graphRelationshipTo", getGraphRelationshipTo())
            .append("graphRelationshipToName", getGraphRelationshipToName())
            .append("pageNumNeo4j", getPageNumNeo4j())
            .append("pageSizeNeo4j", getPageSizeNeo4j())
            .toString();
    }
}
