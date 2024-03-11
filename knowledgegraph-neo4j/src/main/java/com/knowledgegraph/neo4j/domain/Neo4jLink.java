package com.knowledgegraph.neo4j.domain;

import com.knowledgegraph.common.core.domain.BaseEntity;

public class Neo4jLink extends BaseEntity {

    private static final long serialVersionUID = 1L;

    public String from;
    public String fromName;

    public String to;
    public String toName;

    public String linkId;
    public String text;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getFromName() {
        return fromName;
    }

    public void setFromName(String fromName) {
        this.fromName = fromName;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getToName() {
        return toName;
    }

    public void setToName(String toName) {
        this.toName = toName;
    }

    public String getLinkId() {
        return linkId;
    }

    public void setLinkId(String linkId) {
        this.linkId = linkId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Neo4jLink(String from, String fromName, String to, String toName, String linkId, String text) {
        this.from = from;
        this.fromName = fromName;
        this.to = to;
        this.toName = toName;
        this.linkId = linkId;
        this.text = text;
    }

    public Neo4jLink() {
    }
}
