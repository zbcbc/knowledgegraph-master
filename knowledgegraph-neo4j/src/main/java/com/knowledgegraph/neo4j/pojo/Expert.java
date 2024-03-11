package com.knowledgegraph.neo4j.pojo;


public class Expert {

  private long id;
  private String expertName;
  private String expertDeptment;
  private String expertDec;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getExpertName() {
    return expertName;
  }

  public void setExpertName(String expertName) {
    this.expertName = expertName;
  }


  public String getExpertDeptment() {
    return expertDeptment;
  }

  public void setExpertDeptment(String expertDeptment) {
    this.expertDeptment = expertDeptment;
  }


  public String getExpertDec() {
    return expertDec;
  }

  public void setExpertDec(String expertDec) {
    this.expertDec = expertDec;
  }

  @Override
  public String toString() {
    return "Expert{" +
            "id=" + id +
            ", expertName='" + expertName + '\'' +
            ", expertDeptment='" + expertDeptment + '\'' +
            ", expertDec='" + expertDec + '\'' +
            '}';
  }
}
