package com.knowledgegraph.web.controller.neo4j;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.knowledgegraph.common.utils.SecurityUtils;
import com.knowledgegraph.neo4j.service.INeo4jNodeService;
import com.knowledgegraph.system.domain.SysConfig;
import com.knowledgegraph.system.mapper.SysConfigMapper;
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
import com.knowledgegraph.neo4j.domain.Graph;
import com.knowledgegraph.neo4j.service.IGraphService;
import com.knowledgegraph.common.utils.poi.ExcelUtil;
import com.knowledgegraph.common.core.page.TableDataInfo;

/**
 * 图谱维护Controller
 * 
 * @author liaoquefei
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/neo4j/graph")
public class GraphController extends BaseController
{
    @Autowired
    private IGraphService graphService;

    @Autowired
    private INeo4jNodeService neo4jNodeService;


    @Autowired
    private SysConfigMapper configMapper;

    /**
     * 查询图谱维护列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:graph:list')")
    @GetMapping("/list")
    public TableDataInfo list(Graph graph)
    {
        startPage();
        graph.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        List<Graph> list = graphService.selectGraphList(graph);
        return getDataTable(list);
    }

    @GetMapping("/getList")
    public TableDataInfo getList(Graph graph)
    {
        startPage();
        graph.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        List<Graph> list = graphService.getGraphList(graph);
        return getDataTable(list);
    }

    @GetMapping("/listIndex")
    public TableDataInfo listIndex(Graph graph)
    {
        startPage();
        List<Graph> list = graphService.selectGraphList(graph);
        return getDataTable(list);
    }

    @GetMapping("/findIndexGraphKey")
    public AjaxResult findIndexGraphKey()
    {
        SysConfig sysConfig = configMapper.checkConfigKeyUnique("graphIndex");
        return AjaxResult.success(graphService.findIndexGraphKey(sysConfig.getConfigValue()));
    }

    /**
     * 根据登陆人查询创建的图谱列表
     * @param graph
     * @return
     */
    @GetMapping("/getListGraph")
    public AjaxResult getListGraph(Graph graph)
    {
        graph.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        List<Graph> list = graphService.selectGraphList(graph);
        return  AjaxResult.success(list);
    }

    /**
     * 根据登录人查询管理的图谱
     * @param graph
     * @return
     */
    @GetMapping("/getListGraphByMember")
    public AjaxResult getListGraphByMember(Graph graph)
    {
        graph.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        List<Graph> list = graphService.getListGraphByMember(graph);
        return  AjaxResult.success(list);
    }

    /**
     * 导出图谱维护列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:graph:export')")
    @Log(title = "图谱维护", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Graph graph)
    {
        List<Graph> list = graphService.getGraphList(graph);
        ExcelUtil<Graph> util = new ExcelUtil<Graph>(Graph.class);
        util.exportExcel(response, list, "图谱维护数据");
    }

    /**
     * 获取图谱维护详细信息
     */
    @PreAuthorize("@ss.hasPermi('neo4j:graph:query')")
    @GetMapping(value = "/{graphKey}")
    public AjaxResult getInfo(@PathVariable("graphKey") String graphKey)
    {
        return AjaxResult.success(graphService.selectGraphByGraphKey(graphKey));
    }

    @PostMapping(value = "/check")
    public AjaxResult getCheckGraphUniquens(@RequestBody Graph graph)
    {
        return AjaxResult.success(graphService.getCheckGraphUniquens(graph));
    }

    /**
     * 新增图谱维护
     */
    @PreAuthorize("@ss.hasPermi('neo4j:graph:add')")
    @Log(title = "图谱维护", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Graph graph)
    {
        return toAjax(graphService.insertGraph(graph));
    }

    /**
     * 修改图谱维护
     */
    @PreAuthorize("@ss.hasPermi('neo4j:graph:edit')")
    @Log(title = "图谱维护", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Graph graph)
    {
        return toAjax(graphService.updateGraph(graph));
    }

    /**
     * 删除图谱维护
     */
    @PreAuthorize("@ss.hasPermi('neo4j:graph:remove')")
    @Log(title = "图谱维护", businessType = BusinessType.DELETE)
	@DeleteMapping("/{graphKeys}")
    public AjaxResult remove(@PathVariable String[] graphKeys)
    {
        String graphKey =graphKeys[0].toString();
        neo4jNodeService.deleteGraphAllByGraphKey(graphKey);
        return toAjax(graphService.deleteGraphAllByGraphKey(graphKey));
    }
}
