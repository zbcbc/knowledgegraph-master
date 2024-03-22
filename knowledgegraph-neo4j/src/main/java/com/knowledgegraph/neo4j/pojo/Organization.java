package com.knowledgegraph.neo4j.pojo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Organization {

  private long id;
  private String orgName;

  private String orgDec; //机构信息

  private LocalDateTime createTime;
  private LocalDateTime updateTime;
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
