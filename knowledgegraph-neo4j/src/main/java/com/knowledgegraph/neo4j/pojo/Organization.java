package com.knowledgegraph.neo4j.pojo;


public class Organization {

  private long id;
  private String orgName;
  private java.sql.Timestamp createTime;
  private java.sql.Timestamp updateTime;
  private long disabled;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getOrgName() {
    return orgName;
  }

  public void setOrgName(String orgName) {
    this.orgName = orgName;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }


  public java.sql.Timestamp getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(java.sql.Timestamp updateTime) {
    this.updateTime = updateTime;
  }


  public long getDisabled() {
    return disabled;
  }

  public void setDisabled(long disabled) {
    this.disabled = disabled;
  }

  @Override
  public String toString() {
    return "Organization{" +
            "id=" + id +
            ", orgName='" + orgName + '\'' +
            ", createTime=" + createTime +
            ", updateTime=" + updateTime +
            ", disabled=" + disabled +
            '}';
  }
}
