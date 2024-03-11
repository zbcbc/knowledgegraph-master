package com.knowledgegraph.neo4j.controller;

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
import com.knowledgegraph.neo4j.domain.Neo4jTest;
import com.knowledgegraph.neo4j.service.INeo4jTestService;
import com.knowledgegraph.common.utils.poi.ExcelUtil;
import com.knowledgegraph.common.core.page.TableDataInfo;

/**
 * 测试图谱Controller
 * 
 * @author ruoyi
 * @date 2022-03-24
 */
@RestController
@RequestMapping("/neo4j/test")
public class Neo4jTestController extends BaseController
{
    @Autowired
    private INeo4jTestService neo4jTestService;

    /**
     * 查询测试图谱列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:test:list')")
    @GetMapping("/list")
    public TableDataInfo list(Neo4jTest neo4jTest)
    {
        startPage();
        List<Neo4jTest> list = neo4jTestService.selectNeo4jTestList(neo4jTest);
        return getDataTable(list);
    }

    /**
     * 导出测试图谱列表
     */
    @PreAuthorize("@ss.hasPermi('neo4j:test:export')")
    @Log(title = "测试图谱", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Neo4jTest neo4jTest)
    {
        List<Neo4jTest> list = neo4jTestService.selectNeo4jTestList(neo4jTest);
        ExcelUtil<Neo4jTest> util = new ExcelUtil<Neo4jTest>(Neo4jTest.class);
        util.exportExcel(response, list, "测试图谱数据");
    }

    /**
     * 获取测试图谱详细信息
     */
    @PreAuthorize("@ss.hasPermi('neo4j:test:query')")
    @GetMapping(value = "/{neo4jTestKey}")
    public AjaxResult getInfo(@PathVariable("neo4jTestKey") String neo4jTestKey)
    {
        return AjaxResult.success(neo4jTestService.selectNeo4jTestByNeo4jTestKey(neo4jTestKey));
    }

    /**
     * 新增测试图谱
     */
    @PreAuthorize("@ss.hasPermi('neo4j:test:add')")
    @Log(title = "测试图谱", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Neo4jTest neo4jTest)
    {
        return toAjax(neo4jTestService.insertNeo4jTest(neo4jTest));
    }

    /**
     * 修改测试图谱
     */
    @PreAuthorize("@ss.hasPermi('neo4j:test:edit')")
    @Log(title = "测试图谱", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Neo4jTest neo4jTest)
    {
        return toAjax(neo4jTestService.updateNeo4jTest(neo4jTest));
    }

    /**
     * 删除测试图谱
     */
    @PreAuthorize("@ss.hasPermi('neo4j:test:remove')")
    @Log(title = "测试图谱", businessType = BusinessType.DELETE)
	@DeleteMapping("/{neo4jTestKeys}")
    public AjaxResult remove(@PathVariable String[] neo4jTestKeys)
    {
        return toAjax(neo4jTestService.deleteNeo4jTestByNeo4jTestKeys(neo4jTestKeys));
    }
}
