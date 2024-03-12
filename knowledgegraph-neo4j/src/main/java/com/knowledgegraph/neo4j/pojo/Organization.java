package com.knowledgegraph.neo4j.pojo;

import lombok.Data;

@Data
public class Organization {

  private long id;
  private String orgName;

  private String orgDec; //机构信息

  private java.sql.Timestamp createTime;
  private java.sql.Timestamp updateTime;
  private long disabled;



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
