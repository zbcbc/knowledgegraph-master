package com.knowledgegraph.web.controller.neo4j;

import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.domain.*;
import com.knowledgegraph.neo4j.service.IGraphJsonDataService;
import com.knowledgegraph.neo4j.service.IGraphNodeService;
import com.knowledgegraph.neo4j.service.IGraphRelationshipService;
import com.knowledgegraph.neo4j.service.IGraphService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/graphJsonData")
public class GraphJsonDataController {

    @Autowired
    private IGraphJsonDataService graphJsonDataService;

    @Autowired
    private IGraphService graphService;

    @Autowired
    private IGraphNodeService graphNodeService;

    @Autowired
    private IGraphRelationshipService graphRelationshipService;

    @GetMapping(value = "/neo4jTest")
    public AjaxResult getGraphJsonDataTest()
    {
        GraphJsonData graphJsonData = new GraphJsonData();
        List<Neo4jNode> neo4jNodes = new ArrayList<>();
        List<Neo4jLink> neo4jLinks = new ArrayList<>();
        Neo4jNode neo4jNode = null;
        Neo4jLink neo4jLink = null;
        Data data =  null;

        List<Map<String,Object>> nodes = graphJsonDataService.getTestNode();
        List<Map<String,Object>> links = graphJsonDataService.getTestLink();

        for(Map<String,Object> node : nodes){
            neo4jNode = new Neo4jNode();
            neo4jNode.setId(node.get("id").toString());
            neo4jNode.setName(node.get("name").toString());
            data = new Data();
            data.setMyicon("el-icon-star-on");
            neo4jNode.setData(data);
            neo4jNodes.add(neo4jNode);
        }
        graphJsonData.setNodes(neo4jNodes);

        for(Map<String,Object> link : links){
            neo4jLink = new Neo4jLink();
            neo4jLink.setFrom(link.get("from").toString());
            neo4jLink.setTo(link.get("to").toString());
            neo4jLink.setText(link.get("name").toString());
            neo4jLinks.add(neo4jLink);
        }
        graphJsonData.setLinks(neo4jLinks);

        return AjaxResult.success(graphJsonData);
    }

    @GetMapping(value = "/neo4jGraphJson/{graphKey}")
    public AjaxResult getNeo4jGraphJson(@PathVariable("graphKey") String graphKey)
    {
        GraphJsonData graphJsonData = new GraphJsonData();
        List<Neo4jNode> neo4jNodes = new ArrayList<>();
        List<Neo4jLink> neo4jLinks = new ArrayList<>();
        Neo4jNode neo4jNode = null;
        Neo4jLink neo4jLink = null;
        Data data =  null;

        Graph graph = graphService.selectGraphByGraphKey(graphKey);
        graphService.updateGraphViews(graphKey);
        graphJsonData.setGraphTxt(graph.getGraphName()+":"+graph.getGraphRemark()+"-"+graph.getCreateName());

        GraphNode graphNode = new GraphNode();
        GraphRelationship graphRelationship = new GraphRelationship();
        graphNode.setGraphKey(graphKey);
        graphRelationship.setGraphKey(graphKey);
        List<GraphNode> listNodes = graphNodeService.selectGraphNodeList(graphNode);
        List<GraphRelationship> listGraphRelationships = graphRelationshipService.selectGraphRelationshipList(graphRelationship);

//        List<Map<String,Object>> nodes = graphJsonDataService.getTestNode();
//        List<Map<String,Object>> links = graphJsonDataService.getTestLink();

        for(GraphNode node : listNodes){
            neo4jNode = new Neo4jNode();
            data = new Data();

            neo4jNode.setId(node.getGraphNodeId().toString());
            neo4jNode.setName(node.getGraphNodeName());

//            data.setMyicon("el-icon-star-on");
            data.setGraphNodeKey(node.getGraphNodeKey());
            data.setGraphNodeRemark(node.getGraphNodeRemark());

            neo4jNode.setData(data);
            neo4jNodes.add(neo4jNode);
        }
        graphJsonData.setNodes(neo4jNodes);

        for(GraphRelationship link : listGraphRelationships){
            neo4jLink = new Neo4jLink();
            neo4jLink.setFrom(link.getGraphRelationshipFrom().toString());
            neo4jLink.setTo(link.getGraphRelationshipTo().toString());
            neo4jLink.setText(link.getGraphRelationshipName());

            neo4jLinks.add(neo4jLink);
        }
        graphJsonData.setLinks(neo4jLinks);

        return AjaxResult.success(graphJsonData);
    }
}
