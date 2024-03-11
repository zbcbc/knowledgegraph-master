package com.knowledgegraph.web.controller.neo4j;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.knowledgegraph.common.utils.SecurityUtils;
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
import com.knowledgegraph.neo4j.domain.GraphMember;
import com.knowledgegraph.neo4j.service.IGraphMemberService;
import com.knowledgegraph.common.utils.poi.ExcelUtil;
import com.knowledgegraph.common.core.page.TableDataInfo;

/**
 * 图谱成员维护Controller
 * 
 * @author ruoyi
 * @date 2022-04-10
 */
@RestController
@RequestMapping("/neo4j/member")
public class GraphMemberController extends BaseController
{
    @Autowired
    private IGraphMemberService graphMemberService;

    /**
     * 查询图谱成员维护列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:member:list')")
    @GetMapping("/list")
    public TableDataInfo list(GraphMember graphMember)
    {
        startPage();
        graphMember.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        List<GraphMember> list = graphMemberService.selectGraphMemberList(graphMember);
        return getDataTable(list);
    }

    /**
     * 导出图谱成员维护列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:member:export')")
    @Log(title = "图谱成员维护", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GraphMember graphMember)
    {
        List<GraphMember> list = graphMemberService.selectGraphMemberList(graphMember);
        ExcelUtil<GraphMember> util = new ExcelUtil<GraphMember>(GraphMember.class);
        util.exportExcel(response, list, "图谱成员维护数据");
    }

    /**
     * 获取图谱成员维护详细信息
     */
    @PreAuthorize("@ss.hasPermi('neo4j:member:query')")
    @GetMapping(value = "/{graphMemberKey}")
    public AjaxResult getInfo(@PathVariable("graphMemberKey") String graphMemberKey)
    {
        return AjaxResult.success(graphMemberService.selectGraphMemberByGraphMemberKey(graphMemberKey));
    }

    /**
     * 新增图谱成员维护
     */
    @PreAuthorize("@ss.hasPermi('neo4j:member:add')")
    @Log(title = "图谱成员维护", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GraphMember graphMember)
    {
        return toAjax(graphMemberService.insertGraphMember(graphMember));
    }

    /**
     * 修改图谱成员维护
     */
    @PreAuthorize("@ss.hasPermi('neo4j:member:edit')")
    @Log(title = "图谱成员维护", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GraphMember graphMember)
    {
        return toAjax(graphMemberService.updateGraphMember(graphMember));
    }

    /**
     * 删除图谱成员维护
     */
    @PreAuthorize("@ss.hasPermi('neo4j:member:remove')")
    @Log(title = "图谱成员维护", businessType = BusinessType.DELETE)
	@DeleteMapping("/{graphMemberKeys}")
    public AjaxResult remove(@PathVariable String[] graphMemberKeys)
    {
        return toAjax(graphMemberService.deleteGraphMemberByGraphMemberKeys(graphMemberKeys));
    }
}
