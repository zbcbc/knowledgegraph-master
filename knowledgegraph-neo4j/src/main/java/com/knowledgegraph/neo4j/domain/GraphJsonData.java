package com.knowledgegraph.neo4j.domain;

import com.knowledgegraph.common.core.domain.BaseEntity;

import java.util.ArrayList;
import java.util.List;

public class GraphJsonData extends BaseEntity {

    private static final long serialVersionUID = 1L;

    public String graphTxt;

    public List<Neo4jNode> nodes;

    public List<Neo4jLink> links;

    public String getGraphTxt() {
        return graphTxt;
    }

    public void setGraphTxt(String graphTxt) {
        this.graphTxt = graphTxt;
    }

    public List<Neo4jNode> getNodes() {
        return nodes;
    }

    public void setNodes(List<Neo4jNode> nodes) {
        this.nodes = nodes;
    }

    public List<Neo4jLink> getLinks() {
        return links;
    }

    public void setLinks(List<Neo4jLink> links) {
        this.links = links;
    }

    public GraphJsonData() {

        this.nodes = new ArrayList<>();
        this.links = new ArrayList<>();
    }

    public GraphJsonData(String graphTxt,List<Neo4jNode> nodes, List<Neo4jLink> links) {
        this.graphTxt = graphTxt;
        this.nodes = nodes;
        this.links = links;
    }
}
