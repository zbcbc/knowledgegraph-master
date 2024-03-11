package com.knowledgegraph.neo4j.domain;

import com.knowledgegraph.common.core.domain.BaseEntity;

public class Neo4jNode extends BaseEntity {

    private static final long serialVersionUID = 1L;

    public String id;

    public String name;

    public Data data;

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

    public Data getData() {
        return data;
    }

    public void setData(Data data) {
        this.data = data;
    }

    public Neo4jNode() {
        this.data = new Data();
    }

    public Neo4jNode(String id, String name, Data data) {
        this.id = id;
        this.name = name;
        this.data = data;
    }
}
