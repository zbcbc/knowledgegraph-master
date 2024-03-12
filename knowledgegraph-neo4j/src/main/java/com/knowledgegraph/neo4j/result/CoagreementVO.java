package com.knowledgegraph.neo4j.result;

import com.knowledgegraph.neo4j.pojo.Coagreement;

/**
 * Author:  Jinzhenliang
 * Date:  2024/3/12 14:20
 */
public class CoagreementVO {
    //协议ID
    private long agreementId;
    //协议名称
    private String agreementName;
    //组织机构名称
    private String orgName;
    //高校名称
    private String collegeName;
    //协议详细内容
    private String content;

    public long getAgreementId() {
        return agreementId;
    }

    public void setAgreementId(long agreementId) {
        this.agreementId = agreementId;
    }

    public String getAgreementName() {
        return agreementName;
    }

    public void setAgreementName(String agreementName) {
        this.agreementName = agreementName;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
