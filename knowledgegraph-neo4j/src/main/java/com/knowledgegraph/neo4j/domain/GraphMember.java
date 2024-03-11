package com.knowledgegraph.neo4j.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.knowledgegraph.common.annotation.Excel;
import com.knowledgegraph.common.core.domain.BaseEntity;

/**
 * 图谱成员维护对象 graph_member
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
public class GraphMember extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private String graphMemberKey;

    /** 用户主键 */
    private String userKey;

    @Excel(name = "用户名称")
    private String userName;

    /** 图主键 */
    private String graphKey;

    @Excel(name = "图主键")
    private String graphName;

    /** 贡献值 */
    @Excel(name = "贡献值")
    private Long contributionValue;

    /** 加入时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "加入时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date joinTime;

    /** 成员类型 */
    @Excel(name = "成员类型")
    private String graphMemberType;

    /** $column.columnComment */
    private String deleteFlag;

    public void setGraphMemberKey(String graphMemberKey) 
    {
        this.graphMemberKey = graphMemberKey;
    }

    public String getGraphMemberKey() 
    {
        return graphMemberKey;
    }
    public void setUserKey(String userKey) 
    {
        this.userKey = userKey;
    }

    public String getUserKey() 
    {
        return userKey;
    }
    public void setGraphKey(String graphKey) 
    {
        this.graphKey = graphKey;
    }

    public String getGraphKey() 
    {
        return graphKey;
    }
    public void setContributionValue(Long contributionValue) 
    {
        this.contributionValue = contributionValue;
    }

    public Long getContributionValue() 
    {
        return contributionValue;
    }
    public void setJoinTime(Date joinTime) 
    {
        this.joinTime = joinTime;
    }

    public Date getJoinTime() 
    {
        return joinTime;
    }
    public void setGraphMemberType(String graphMemberType) 
    {
        this.graphMemberType = graphMemberType;
    }

    public String getGraphMemberType() 
    {
        return graphMemberType;
    }
    public void setDeleteFlag(String deleteFlag) 
    {
        this.deleteFlag = deleteFlag;
    }

    public String getDeleteFlag() 
    {
        return deleteFlag;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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
            .append("graphMemberKey", getGraphMemberKey())
            .append("userKey", getUserKey())
            .append("graphKey", getGraphKey())
            .append("userName", getUserName())
            .append("graphName", getGraphName())
            .append("contributionValue", getContributionValue())
            .append("joinTime", getJoinTime())
            .append("graphMemberType", getGraphMemberType())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("deleteFlag", getDeleteFlag())
            .toString();
    }
}
