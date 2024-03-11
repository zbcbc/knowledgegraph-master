package com.knowledgegraph.web.controller.neo4j;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.knowledgegraph.common.utils.DateUtils;
import com.knowledgegraph.common.utils.SecurityUtils;
import com.knowledgegraph.common.utils.uuid.UUID;
import com.knowledgegraph.neo4j.domain.Graph;
import com.knowledgegraph.neo4j.service.IGraphService;
import com.knowledgegraph.neo4j.service.INeo4jNodeService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.knowledgegraph.common.annotation.Log;
import com.knowledgegraph.common.core.controller.BaseController;
import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.common.enums.BusinessType;
import com.knowledgegraph.neo4j.domain.GraphNode;
import com.knowledgegraph.neo4j.service.IGraphNodeService;
import com.knowledgegraph.common.utils.poi.ExcelUtil;
import com.knowledgegraph.common.core.page.TableDataInfo;

/**
 * 节点维护Controller
 * 
 * @author liaoquefei
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/neo4j/node")
public class GraphNodeController extends BaseController
{
    @Autowired
    private IGraphNodeService graphNodeService;

    @Autowired
    private INeo4jNodeService neo4jNodeService;

    @Autowired
    private IGraphService graphService;

    /**
     * 查询节点维护列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:node:list')")
    @GetMapping("/list")
    public TableDataInfo list(GraphNode graphNode)
    {
        startPage();
        List<GraphNode> list = graphNodeService.selectGraphNodeList(graphNode);
        return getDataTable(list);
    }

    @GetMapping("/listByGraphKey")
    public AjaxResult listByGraphKey(GraphNode graphNode)
    {
        List<GraphNode> list = graphNodeService.selectGraphNodeList(graphNode);
        return AjaxResult.success(list);
    }

    /**
     * 导出节点维护列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:node:export')")
    @Log(title = "节点维护", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GraphNode graphNode)
    {
        List<GraphNode> list = graphNodeService.selectGraphNodeList(graphNode);
        ExcelUtil<GraphNode> util = new ExcelUtil<GraphNode>(GraphNode.class);
        util.exportExcel(response, list, "节点维护数据");
    }

    /**
     * 获取节点维护详细信息
     */
    @PreAuthorize("@ss.hasPermi('neo4j:node:query')")
    @GetMapping(value = "/{graphNodeKey}")
    public AjaxResult getInfo(@PathVariable("graphNodeKey") String graphNodeKey)
    {
        return AjaxResult.success(graphNodeService.selectGraphNodeByGraphNodeKey(graphNodeKey));
    }

    /**
     * 新增节点维护
     */
    @PreAuthorize("@ss.hasPermi('neo4j:node:add')")
    @Log(title = "节点维护", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GraphNode graphNode)
    {
        graphNode.setGraphNodeKey(UUID.randomUUID().toString());
        graphNode.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        graphNode.setCreateTime(DateUtils.getNowDate());
        graphNode.setGraphNodeTime(DateUtils.getNowDate());
//        String graphNodeMyicon = "el-icon-" + graphNode.getGraphNodeMyicon() + "-on";
        graphNode.setGraphNodeMyicon("el-icon-star-on");
        graphNode.setGraphNodeId((long)neo4jNodeService.insertGraphNode(graphNode));
        Graph graph = new Graph();
        graph.setGraphKey(graphNode.getGraphKey());
        graph.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        graphService.updateGraph(graph);
        return toAjax(graphNodeService.insertGraphNode(graphNode));
    }

    /**
     * 修改节点维护
     */
    @PreAuthorize("@ss.hasPermi('neo4j:node:edit')")
    @Log(title = "节点维护", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GraphNode graphNode)
    {
        Graph graph = new Graph();
        graph.setGraphKey(graphNode.getGraphKey());
        graph.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        graphService.updateGraph(graph);
        neo4jNodeService.updateGraphNode(graphNode);
        return toAjax(graphNodeService.updateGraphNode(graphNode));
    }

    /**
     * 删除节点维护
     */
    @PreAuthorize("@ss.hasPermi('neo4j:node:remove')")
    @Log(title = "节点维护", businessType = BusinessType.DELETE)
	@PostMapping("/delNode")
    public AjaxResult remove(@RequestBody List<GraphNode> graphNodes )
    {
        String[] graphNodeKeys = new String[graphNodes.size()];
        String[] graphNodeIds = new String[graphNodes.size()];
        for(int i=0 ;i< graphNodes.size();i++){
            graphNodeKeys[i] = graphNodes.get(i).getGraphNodeKey();
            graphNodeIds[i] = graphNodes.get(i).getGraphNodeId().toString();
        }
        neo4jNodeService.deleteGraphNodeByGraphNodeKeys(graphNodeIds);
        return toAjax(graphNodeService.deleteGraphNodeByGraphNodeKeys(graphNodeKeys));
    }
}
