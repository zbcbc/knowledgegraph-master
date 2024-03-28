package com.knowledgegraph.web.controller.neo4j;

import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.pojo.Expert;
import com.knowledgegraph.neo4j.pojo.Organization;
import com.knowledgegraph.neo4j.pojo.Relationship;
import com.knowledgegraph.neo4j.result.dto.CreateExpertDto;
import com.knowledgegraph.neo4j.result.dto.OrganizationDto;
import com.knowledgegraph.neo4j.service.IExpertService;
import com.knowledgegraph.neo4j.service.RelationshipService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

/**
 * ClassName: ExpertController
 * Package: com.knowledgegraph.web.controller.neo4j
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/22 13:48
 * @Version 1.0
 */
@RestController
@RequestMapping("/neo4j/expert")
@Api(value = "以专家为单位的管理接口", tags = "以专家为单位的管理接口")
public class ExpertController {
    @Autowired
    IExpertService iExpertService;
    @Autowired
    RelationshipService relationshipService;

    @ApiOperation("增加专家结点")
    @PostMapping()
    public AjaxResult createExpert(@RequestBody Expert expert){
        boolean save = iExpertService.save(expert);
        if(save == true){
            return AjaxResult.success("增加专家结点成功");
        }else {
            return AjaxResult.error("增加专家失败");
        }
    }

    //todo:设计DTO类，编写业务层代码 具体待定
    @ApiOperation("增加专家结点以及该专家的研究方向、论文")
    public AjaxResult createExpertWithAreaPaper(@RequestBody CreateExpertDto createExpertDto){
        return null;
    }

    @ApiOperation("删除专家结点")
    @DeleteMapping("/{expertId}")
    public AjaxResult deleteExpert(@PathVariable Long expertId){
        return iExpertService.deleteExpert(expertId);
    }

    @ApiOperation("删除某专家的某研究方向结点")
    @DeleteMapping
    public AjaxResult deleteAreaWithExpert(@RequestParam("expertId") Long expertId, @RequestParam("researchAreaId") Long researchAreaId){
        return iExpertService.deleteAreaWithExpert(expertId, researchAreaId);
    }

//    @ApiOperation("增加专家-机构关系")
//    @PostMapping("/withOrganization")
//    public AjaxResult createRelationWithExpertOrg(@RequestBody Relationship relationship){
//        boolean save = relationshipService.save(relationship);
//        if(save == true){
//            return AjaxResult.success("增加专家-机构关系成功");
//        }else {
//            return AjaxResult.error("增加专家-机构关系失败");
//        }
//    }



}
