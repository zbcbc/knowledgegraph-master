package com.knowledgegraph.neo4j.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.knowledgegraph.common.annotation.Excel;
import com.knowledgegraph.common.core.domain.BaseEntity;

/**
 * 申请审核对象 graph_apply
 * 
 * @author liaoquefei
 * @date 2022-04-11
 */
public class GraphApply extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 申请主键 */
    private String applyKey;

    /** 申请人 */
    @Excel(name = "申请人")
    private String applyUserName;

    private String applyUser;

    /** 申请图 */
    @Excel(name = "申请图")
    private String graphName;

    private String graphKey;

    /** 申请时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "申请时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date applyTime;

    /** 申请备注 */
    @Excel(name = "申请备注")
    private String applyRemark;

    /** 审核状态 */
    @Excel(name = "审核状态")
    private String applySign;

    /** 审核结果 */
    @Excel(name = "审核结果")
    private String applyFlag;

    /** 审核时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date examineTime;

    /** 审核意见 */
    @Excel(name = "审核意见")
    private String examineRemark;

    /** $column.columnComment */
    private String deleteFlag;

    public void setApplyKey(String applyKey) 
    {
        this.applyKey = applyKey;
    }

    public String getApplyKey() 
    {
        return applyKey;
    }
    public void setApplyUser(String applyUser) 
    {
        this.applyUser = applyUser;
    }

    public String getApplyUser() 
    {
        return applyUser;
    }
    public void setGraphKey(String graphKey) 
    {
        this.graphKey = graphKey;
    }

    public String getGraphKey() 
    {
        return graphKey;
    }
    public void setApplyTime(Date applyTime) 
    {
        this.applyTime = applyTime;
    }

    public Date getApplyTime() 
    {
        return applyTime;
    }
    public void setApplyRemark(String applyRemark) 
    {
        this.applyRemark = applyRemark;
    }

    public String getApplyRemark() 
    {
        return applyRemark;
    }
    public void setApplySign(String applySign) 
    {
        this.applySign = applySign;
    }

    public String getApplySign() 
    {
        return applySign;
    }
    public void setApplyFlag(String applyFlag) 
    {
        this.applyFlag = applyFlag;
    }

    public String getApplyFlag() 
    {
        return applyFlag;
    }
    public void setExamineTime(Date examineTime) 
    {
        this.examineTime = examineTime;
    }

    public Date getExamineTime() 
    {
        return examineTime;
    }
    public void setExamineRemark(String examineRemark) 
    {
        this.examineRemark = examineRemark;
    }

    public String getExamineRemark() 
    {
        return examineRemark;
    }
    public void setDeleteFlag(String deleteFlag) 
    {
        this.deleteFlag = deleteFlag;
    }

    public String getDeleteFlag() 
    {
        return deleteFlag;
    }

    public String getApplyUserName() {
        return applyUserName;
    }

    public void setApplyUserName(String applyUserName) {
        this.applyUserName = applyUserName;
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
            .append("applyKey", getApplyKey())
            .append("applyUser", getApplyUser())
            .append("graphKey", getGraphKey())
            .append("applyUserName", getApplyUserName())
            .append("graphName", getGraphName())
            .append("applyTime", getApplyTime())
            .append("applyRemark", getApplyRemark())
            .append("applySign", getApplySign())
            .append("applyFlag", getApplyFlag())
            .append("examineTime", getExamineTime())
            .append("examineRemark", getExamineRemark())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("deleteFlag", getDeleteFlag())
            .toString();
    }
}
