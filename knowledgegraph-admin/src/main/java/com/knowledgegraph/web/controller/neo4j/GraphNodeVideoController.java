package com.knowledgegraph.web.controller.neo4j;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.knowledgegraph.neo4j.domain.GraphNodeVideo;
import com.knowledgegraph.neo4j.service.IGraphNodeVideoService;
import com.knowledgegraph.common.utils.poi.ExcelUtil;
import com.knowledgegraph.common.core.page.TableDataInfo;

/**
 * 节点视频资源Controller
 * 
 * @author liaoquefei
 * @date 2022-04-16
 */
@RestController
@RequestMapping("/neo4j/video")
public class GraphNodeVideoController extends BaseController
{
    @Autowired
    private IGraphNodeVideoService graphNodeVideoService;

    /**
     * 查询节点视频资源列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:video:list')")
    @GetMapping("/list")
    public TableDataInfo list(GraphNodeVideo graphNodeVideo)
    {
        startPage();
        List<GraphNodeVideo> list = graphNodeVideoService.selectGraphNodeVideoList(graphNodeVideo);
        return getDataTable(list);
    }

    /**
     * 导出节点视频资源列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:video:export')")
    @Log(title = "节点视频资源", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GraphNodeVideo graphNodeVideo)
    {
        List<GraphNodeVideo> list = graphNodeVideoService.selectGraphNodeVideoList(graphNodeVideo);
        ExcelUtil<GraphNodeVideo> util = new ExcelUtil<GraphNodeVideo>(GraphNodeVideo.class);
        util.exportExcel(response, list, "节点视频资源数据");
    }

    /**
     * 获取节点视频资源详细信息
     */
    @PreAuthorize("@ss.hasPermi('neo4j:video:query')")
    @GetMapping(value = "/{graphNodeVideoKey}")
    public AjaxResult getInfo(@PathVariable("graphNodeVideoKey") String graphNodeVideoKey)
    {
        return AjaxResult.success(graphNodeVideoService.selectGraphNodeVideoByGraphNodeVideoKey(graphNodeVideoKey));
    }

    /**
     * 新增节点视频资源
     */
    @PreAuthorize("@ss.hasPermi('neo4j:video:add')")
    @Log(title = "节点视频资源", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GraphNodeVideo graphNodeVideo)
    {
        return toAjax(graphNodeVideoService.insertGraphNodeVideo(graphNodeVideo));
    }

    /**
     * 修改节点视频资源
     */
    @PreAuthorize("@ss.hasPermi('neo4j:video:edit')")
    @Log(title = "节点视频资源", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GraphNodeVideo graphNodeVideo)
    {
        return toAjax(graphNodeVideoService.updateGraphNodeVideo(graphNodeVideo));
    }

    /**
     * 删除节点视频资源
     */
    @PreAuthorize("@ss.hasPermi('neo4j:video:remove')")
    @Log(title = "节点视频资源", businessType = BusinessType.DELETE)
	@DeleteMapping("/{graphNodeVideoKeys}")
    public AjaxResult remove(@PathVariable String[] graphNodeVideoKeys)
    {
        return toAjax(graphNodeVideoService.deleteGraphNodeVideoByGraphNodeVideoKeys(graphNodeVideoKeys));
    }
}
