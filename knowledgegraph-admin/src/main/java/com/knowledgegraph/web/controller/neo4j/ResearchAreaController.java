package com.knowledgegraph.web.controller.neo4j;

import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.pojo.Expert;
import com.knowledgegraph.neo4j.pojo.ExpertAreas;
import com.knowledgegraph.neo4j.pojo.Relationship;
import com.knowledgegraph.neo4j.pojo.ResearchAreas;
import com.knowledgegraph.neo4j.service.ExpertAreasService;
import com.knowledgegraph.neo4j.service.ResearchAreasService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ClassName: ResearchAreaController
 * Package: com.knowledgegraph.web.controller.neo4j
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/22 14:50
 * @Version 1.0
 */
@RestController
@RequestMapping("/neo4j/researchArea")
@Api(value = "以研究方向为单位的管理接口", tags = "以研究方向为单位的管理接口")
public class ResearchAreaController {
    @Autowired
    ResearchAreasService researchAreasService;
    @Autowired
    ExpertAreasService expertAreasService;

    @ApiOperation("增加研究方向结点")
    @PostMapping()
    public AjaxResult createExpert(@RequestBody ResearchAreas researchAreas){
        boolean save = researchAreasService.save(researchAreas);
        if(save == true){
            return AjaxResult.success("增加研究方向结点成功");
        }else {
            return AjaxResult.error("增加研究方向结点失败");
        }
    }




}
