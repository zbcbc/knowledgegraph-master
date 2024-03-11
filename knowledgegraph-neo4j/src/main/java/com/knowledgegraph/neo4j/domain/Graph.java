package com.knowledgegraph.neo4j.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.knowledgegraph.common.annotation.Excel;
import com.knowledgegraph.common.core.domain.BaseEntity;

/**
 * 图谱维护对象 graph
 * 
 * @author liaoquefei
 * @date 2022-04-10
 */
public class Graph extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 图主键 */
    private String graphKey;

    /** 图谱名称 */
    @Excel(name = "图谱名称")
    private String graphName;

    private String graphNameLike;

    /** 图谱类型 */
    @Excel(name = "图谱类型 0-私有 1-共有")
    private String graphType;

    /** 图谱简介 */
    @Excel(name = "图谱简介")
    private String graphRemark;

    /** 图谱封面 */
    private String graphImgUrl;

    private String createName;

    private String createKey;

    private String createSign;

    private String avatar;

    /** 图浏览量 */
    @Excel(name = "图浏览量")
    private Long graphViews;

    /** 图维护量 */
    @Excel(name = "图维护量")
    private Long graphUpdateNumber;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date graphTime;

    /** 删除 0-未删 1-已删 */
    private String deleteFlag;

    public void setGraphKey(String graphKey) 
    {
        this.graphKey = graphKey;
    }

    public String getGraphKey() 
    {
        return graphKey;
    }
    public void setGraphName(String graphName) 
    {
        this.graphName = graphName;
    }

    public String getGraphName() 
    {
        return graphName;
    }
    public void setGraphType(String graphType) 
    {
        this.graphType = graphType;
    }

    public String getGraphType() 
    {
        return graphType;
    }
    public void setGraphRemark(String graphRemark) 
    {
        this.graphRemark = graphRemark;
    }

    public String getGraphRemark() 
    {
        return graphRemark;
    }
    public void setGraphImgUrl(String graphImgUrl) 
    {
        this.graphImgUrl = graphImgUrl;
    }

    public String getGraphImgUrl() 
    {
        return graphImgUrl;
    }
    public void setGraphViews(Long graphViews) 
    {
        this.graphViews = graphViews;
    }

    public Long getGraphViews() 
    {
        return graphViews;
    }
    public void setGraphTime(Date graphTime) 
    {
        this.graphTime = graphTime;
    }

    public Date getGraphTime() 
    {
        return graphTime;
    }
    public void setGraphUpdateNumber(Long graphUpdateNumber) 
    {
        this.graphUpdateNumber = graphUpdateNumber;
    }

    public Long getGraphUpdateNumber() 
    {
        return graphUpdateNumber;
    }
    public void setDeleteFlag(String deleteFlag) 
    {
        this.deleteFlag = deleteFlag;
    }

    public String getDeleteFlag() 
    {
        return deleteFlag;
    }

    public String getGraphNameLike() {
        return graphNameLike;
    }

    public void setGraphNameLike(String graphNameLike) {
        this.graphNameLike = graphNameLike;
    }

    public String getCreateName() {
        return createName;
    }

    public void setCreateName(String createName) {
        this.createName = createName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getCreateKey() {
        return createKey;
    }

    public void setCreateKey(String createKey) {
        this.createKey = createKey;
    }

    public String getCreateSign() {
        return createSign;
    }

    public void setCreateSign(String createSign) {
        this.createSign = createSign;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("graphKey", getGraphKey())
            .append("graphName", getGraphName())
            .append("graphType", getGraphType())
            .append("graphRemark", getGraphRemark())
            .append("graphImgUrl", getGraphImgUrl())
            .append("graphViews", getGraphViews())
            .append("graphTime", getGraphTime())
            .append("graphUpdateNumber", getGraphUpdateNumber())
            .append("createBy", getCreateBy())
            .append("createName", getCreateName())
            .append("avatar", getAvatar())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("deleteFlag", getDeleteFlag())
            .append("graphNameLike", getGraphNameLike())
            .append("createKey", getCreateKey())
            .append("createSign", getCreateSign())
            .toString();
    }
}
