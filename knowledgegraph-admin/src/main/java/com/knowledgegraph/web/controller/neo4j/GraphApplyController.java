package com.knowledgegraph.web.controller.neo4j;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.knowledgegraph.common.utils.SecurityUtils;
import com.knowledgegraph.neo4j.domain.GraphMember;
import com.knowledgegraph.neo4j.service.IGraphMemberService;
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
import com.knowledgegraph.neo4j.domain.GraphApply;
import com.knowledgegraph.neo4j.service.IGraphApplyService;
import com.knowledgegraph.common.utils.poi.ExcelUtil;
import com.knowledgegraph.common.core.page.TableDataInfo;

/**
 * 申请审核Controller
 * 
 * @author liaoquefei
 * @date 2022-04-11
 */
@RestController
@RequestMapping("/neo4j/apply")
public class GraphApplyController extends BaseController
{
    @Autowired
    private IGraphApplyService graphApplyService;

    @Autowired
    private IGraphMemberService graphMemberService;

    /**
     * 查询申请审核列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:apply:list')")
    @GetMapping("/list")
    public TableDataInfo list(GraphApply graphApply)
    {
        graphApply.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        startPage();
        List<GraphApply> list = graphApplyService.selectGraphApplyList(graphApply);
        return getDataTable(list);
    }

    /**
     * 我的申请
     * @param graphApply
     * @return
     */
    @GetMapping("/listMy")
    public TableDataInfo listMy(GraphApply graphApply)
    {
        graphApply.setApplyUser(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        startPage();
        List<GraphApply> list = graphApplyService.selectGraphApplyList(graphApply);
        return getDataTable(list);
    }

    /**
     * 导出申请审核列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:apply:export')")
    @Log(title = "申请审核", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GraphApply graphApply)
    {
        graphApply.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        List<GraphApply> list = graphApplyService.selectGraphApplyList(graphApply);
        ExcelUtil<GraphApply> util = new ExcelUtil<GraphApply>(GraphApply.class);
        util.exportExcel(response, list, "申请审核数据");
    }

    /**
     * 我的申请
     * @param response
     * @param graphApply
     */
    @PostMapping("/exportMy")
    public void exportMy(HttpServletResponse response, GraphApply graphApply)
    {
        graphApply.setApplyUser(SecurityUtils.getLoginUser().getUser().getUserId().toString());
        List<GraphApply> list = graphApplyService.selectGraphApplyList(graphApply);
        ExcelUtil<GraphApply> util = new ExcelUtil<GraphApply>(GraphApply.class);
        util.exportExcel(response, list, "申请审核数据");
    }

    /**
     * 获取申请审核详细信息
     */
    @PreAuthorize("@ss.hasPermi('neo4j:apply:query')")
    @GetMapping(value = "/{applyKey}")
    public AjaxResult getInfo(@PathVariable("applyKey") String applyKey)
    {
        return AjaxResult.success(graphApplyService.selectGraphApplyByApplyKey(applyKey));
    }

    /**
     * 新增申请审核
     */
    @PreAuthorize("@ss.hasPermi('neo4j:apply:add')")
    @Log(title = "申请审核", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GraphApply graphApply)
    {
        graphApply.setApplyUser(SecurityUtils.getLoginUser().getUser().getUserId().toString());

        GraphMember graphMember = new GraphMember();
        graphMember.setGraphKey(graphApply.getGraphKey());
        graphMember.setUserKey(graphApply.getApplyUser());
        List<GraphMember> list = graphMemberService.selectGraphMemberList(graphMember);
        if(list.size()>0){
            return AjaxResult.success(2);
        }else{
            GraphApply apply = new GraphApply();
            apply.setApplyUser(SecurityUtils.getLoginUser().getUser().getUserId().toString());
            apply.setGraphKey(graphApply.getGraphKey());
            apply.setApplySign("0");
            List<GraphApply> listApply = graphApplyService.selectGraphApplyList(graphApply);
            if(listApply.size() > 0){
                return AjaxResult.success(3);
            }else{
                return AjaxResult.success(graphApplyService.insertGraphApply(graphApply));
            }
        }


    }

    /**
     * 修改申请审核
     */
    @PreAuthorize("@ss.hasPermi('neo4j:apply:edit')")
    @Log(title = "申请审核", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GraphApply graphApply)
    {
        return toAjax(graphApplyService.updateGraphApply(graphApply));
    }

    /**
     * 删除申请审核
     */
    @PreAuthorize("@ss.hasPermi('neo4j:apply:remove')")
    @Log(title = "申请审核", businessType = BusinessType.DELETE)
	@DeleteMapping("/{applyKeys}")
    public AjaxResult remove(@PathVariable String[] applyKeys)
    {
        return toAjax(graphApplyService.deleteGraphApplyByApplyKeys(applyKeys));
    }
}
