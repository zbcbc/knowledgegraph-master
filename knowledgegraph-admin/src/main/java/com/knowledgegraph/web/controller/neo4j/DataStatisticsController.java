package com.knowledgegraph.web.controller.neo4j;

import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.service.IDataStatisticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 数据统计Mapper接口
 *
 * @author liaoquefei
 * @date 2022-04-18
 */
@RestController
@RequestMapping("/neo4j/dataStatis")
public class DataStatisticsController {

    @Autowired
    private IDataStatisticsService dataStatisticsService;

    @GetMapping(value = "/lineChart")
    public AjaxResult getLineChart()
    {
        return AjaxResult.success(dataStatisticsService.lineChart());
    }

}
