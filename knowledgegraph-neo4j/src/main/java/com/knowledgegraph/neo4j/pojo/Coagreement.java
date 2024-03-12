package com.knowledgegraph.neo4j.pojo;

/**
 * Author:  Jinzhenliang
 * Date:  2024/3/12 10:56
 */
public class Coagreement {

    //合作协议ID
    private long id;
    //协议名称
    private String agreementName;
    //协议类型（0：框架协议，1：学生交流，2：学术交流）
    private int agreementType;
    //协议具体内容的文件地址
    private String agreementContent;
    //组织机构ID
    private long organizationId;
    //高校ID
    private long collegeId;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getAgreementName() {
        return agreementName;
    }

    public void setAgreementName(String agreementName) {
        this.agreementName = agreementName;
    }

    public int getAgreementType() {
        return agreementType;
    }

    public void setAgreementType(int agreementType) {
        this.agreementType = agreementType;
    }

    public String getAgreementContent() {
        return agreementContent;
    }

    public void setAgreementContent(String agreementContent) {
        this.agreementContent = agreementContent;
    }

    public long getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(long organizationId) {
        this.organizationId = organizationId;
    }

    public long getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(long collegeId) {
        this.collegeId = collegeId;
    }

    @Override
    public String toString() {
        return "Coagreement{" +
                "id=" + id +
                ", agreementName='" + agreementName + '\'' +
                ", agreementType=" + agreementType +
                ", agreementContent='" + agreementContent + '\'' +
                ", organizationId=" + organizationId +
                ", collegeId=" + collegeId +
                '}';
    }
}
