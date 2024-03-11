package com.knowledgegraph.neo4j.pojo;

public class Relationship {

  private long id;
  private long category;
  private long orgId;
  private long expertId;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getCategory() {
    return category;
  }

  public void setCategory(long category) {
    this.category = category;
  }


  public long getOrgId() {
    return orgId;
  }

  public void setOrgId(long orgId) {
    this.orgId = orgId;
  }


  public long getExpertId() {
    return expertId;
  }

  public void setExpertId(long expertId) {
    this.expertId = expertId;
  }

  @Override
  public String toString() {
    return "Relationship{" +
            "id=" + id +
            ", category=" + category +
            ", orgId=" + orgId +
            ", expertId=" + expertId +
            '}';
  }
}
