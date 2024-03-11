package com.knowledgegraph.web.controller.neo4j;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

import com.knowledgegraph.common.utils.SecurityUtils;
import com.knowledgegraph.neo4j.domain.Graph;
import com.knowledgegraph.neo4j.service.IGraphMemberService;
import com.knowledgegraph.neo4j.service.IGraphService;
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
import com.knowledgegraph.neo4j.domain.GraphRelationship;
import com.knowledgegraph.neo4j.service.IGraphRelationshipService;
import com.knowledgegraph.common.utils.poi.ExcelUtil;
import com.knowledgegraph.common.core.page.TableDataInfo;

/**
 * 关系维护Controller
 * 
 * @author liaoquefei
 * @date 2022-04-11
 */
@RestController
@RequestMapping("/neo4j/relationship")
public class GraphRelationshipController extends BaseController
{
    @Autowired
    private IGraphRelationshipService graphRelationshipService;


    @Autowired
    private IGraphService graphService;

    /**
     * 查询关系维护列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:relationship:list')")
    @GetMapping("/list")
    public AjaxResult list(GraphRelationship graphRelationship)
    {
        Map<String,Object> data = new HashMap<>();
        graphRelationship.startPage();
        List<GraphRelationship> list = graphRelationshipService.selectGraphRelationshipList(graphRelationship);
        data.put("total",graphRelationshipService.selectGraphRelationshipListTotal(graphRelationship));
        data.put("rows",list);
        return AjaxResult.success(data);
    }

    /**
     * 导出关系维护列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:relationship:export')")
    @Log(title = "关系维护", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GraphRelationship graphRelationship)
    {
        List<GraphRelationship> list = graphRelationshipService.selectGraphRelationshipList(graphRelationship);
        ExcelUtil<GraphRelationship> util = new ExcelUtil<GraphRelationship>(GraphRelationship.class);
        util.exportExcel(response, list, "关系维护数据");
    }

    /**
     * 获取关系维护详细信息
     */
    @PreAuthorize("@ss.hasPermi('neo4j:relationship:query')")
    @GetMapping(value = "/{graphRelationshipId}")
    public AjaxResult getInfo(@PathVariable("graphRelationshipId") Long graphRelationshipId)
    {
        return AjaxResult.success(graphRelationshipService.selectGraphRelationshipByGraphRelationshipId(graphRelationshipId));
    }

    /**
     * 新增关系维护
     */
    @PreAuthorize("@ss.hasPermi('neo4j:relationship:add')")
    @Log(title = "关系维护", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GraphRelationship graphRelationship)
    {
        Graph graph = new Graph();
        graph.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        graph.setGraphKey(graphRelationship.getGraphKey());
        graphService.updateGraph(graph);
        return toAjax(graphRelationshipService.insertGraphRelationship(graphRelationship));
    }

    /**
     * 修改关系维护
     */
    @PreAuthorize("@ss.hasPermi('neo4j:relationship:edit')")
    @Log(title = "关系维护", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GraphRelationship graphRelationship)
    {
        Graph graph = new Graph();
        graph.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        graph.setGraphKey(graphRelationship.getGraphKey());
        graphService.updateGraph(graph);
        return toAjax(graphRelationshipService.updateGraphRelationship(graphRelationship));
    }

    /**
     * 删除关系维护
     */
    @PreAuthorize("@ss.hasPermi('neo4j:relationship:remove')")
    @Log(title = "关系维护", businessType = BusinessType.DELETE)
	@DeleteMapping("/{graphRelationshipIds}")
    public AjaxResult remove(@PathVariable Long[] graphRelationshipIds)
    {
        return toAjax(graphRelationshipService.deleteGraphRelationshipByGraphRelationshipIds(graphRelationshipIds));
    }
}
