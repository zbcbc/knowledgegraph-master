package com.knowledgegraph.web.controller.neo4j;

import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.result.OrgExpertsDto;
import com.knowledgegraph.neo4j.service.IExpertService;
import com.knowledgegraph.neo4j.service.IOrganizationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * ClassName: OrganizationBasedController
 * Package: com.knowledgegraph.web.controller.neo4j
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/6 15:04
 * @Version 1.0
 */
@RestController
@RequestMapping("/neo4j/organization")
@Api(value = "以组织机构为单位的管理接口", tags = "以组织机构为单位的管理接口")
public class OrganizationBasedController {
    @Autowired
    IOrganizationService iOrganizationService;
    @Autowired
    private IExpertService iExpertService;


    @ApiOperation("查询xx机构,关系为合作/属于/到访的专家")
    @GetMapping("/staff")
    public AjaxResult queryExperts(@RequestParam("orgName") String orgName,
                                   @RequestParam(value = "relationship", required = false) Integer relationship){

        return AjaxResult.success(iOrganizationService.queryExperts(orgName, relationship));
    }




}
