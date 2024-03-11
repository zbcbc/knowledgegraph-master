package com.knowledgegraph.neo4j.domain;

import com.knowledgegraph.common.core.domain.BaseEntity;

public class Data  extends BaseEntity {

    private static final long serialVersionUID = 1L;

    public String id;

    public String name;

    public String myicon;

    private String graphNodeKey;

    private String graphNodeRemark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMyicon() {
        return myicon;
    }

    public void setMyicon(String myicon) {
        this.myicon = myicon;
    }

    public String getGraphNodeKey() {
        return graphNodeKey;
    }

    public void setGraphNodeKey(String graphNodeKey) {
        this.graphNodeKey = graphNodeKey;
    }

    public String getGraphNodeRemark() {
        return graphNodeRemark;
    }

    public void setGraphNodeRemark(String graphNodeRemark) {
        this.graphNodeRemark = graphNodeRemark;
    }

    public Data() {
    }

    public Data(String id, String name, String myicon, String graphNodeKey, String graphNodeRemark) {
        this.id = id;
        this.name = name;
        this.myicon = myicon;
        this.graphNodeKey = graphNodeKey;
        this.graphNodeRemark = graphNodeRemark;
    }
}
