package com.knowledgegraph.web.controller.neo4j;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.pojo.Coagreement;
import com.knowledgegraph.neo4j.pojo.Organization;
import com.knowledgegraph.neo4j.pojo.Relationship;
import com.knowledgegraph.neo4j.result.dto.OrganizationDto;
import com.knowledgegraph.neo4j.result.vo.CoagreementVO;
import com.knowledgegraph.neo4j.service.ICoagreementService;
import com.knowledgegraph.neo4j.service.IExpertService;
import com.knowledgegraph.neo4j.service.IOrganizationService;
import com.knowledgegraph.neo4j.service.RelationshipService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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
public class OrganizationController {
    @Autowired
    IOrganizationService iOrganizationService;
    @Autowired
    private IExpertService iExpertService;
    @Autowired
    private ICoagreementService iCoagreementService;
    @Autowired
    private RelationshipService relationshipService;

    @ApiOperation("查询xx机构,关系为属于/合作/到访的专家(relationship 0:属于;1:合作;2:到访)" )
    @GetMapping("/staff")
    public AjaxResult queryExperts(@RequestParam("orgName") String orgName,
                                   @RequestParam(value = "relationship", required = false) Integer relationship){
        if(orgName == null){
            return AjaxResult.error("机构名称不能为空");
        }

        return AjaxResult.success(iOrganizationService.queryExperts(orgName, relationship));
    }

    @ApiOperation("查询以xx机构为单位，关联的专家及其研究方向、论文的知识图谱")
    @GetMapping("/query")
    public AjaxResult queryGraph(@RequestParam("orgName") String orgName,
                                 @RequestParam(value = "relationship", required = false) Integer relationship){
        if(orgName == null){
            return AjaxResult.error("机构名称不能为空");
        }
        return AjaxResult.success(iOrganizationService.queryGraph(orgName, relationship));
    }


    @ApiOperation("查询xx机构,类型为框架协议/学生交流/学术交流的协议")
    @GetMapping("/coagreement")
    public AjaxResult queryCoagreement(String orgName,
                                   @RequestParam(value = "agreementType", required = false) Integer agreementType){
       Long orgId = iOrganizationService.getOrganizationByOrgName(orgName);
        List<Coagreement> coList = iCoagreementService.getCoagreementByOrgId(orgId, agreementType);
        //TODO 需要包装给前端的VO
        List<CoagreementVO> voList = new ArrayList<>();
        CoagreementVO vo = new CoagreementVO();
        Coagreement coagreement;
        for (int i = 0; i < coList.size(); i++) {
            coagreement = coList.get(i);
            vo.setOrgName(orgName);
            vo.setAgreementId(coagreement.getId());
            vo.setContent(coagreement.getAgreementContent());
            vo.setCollegeName("xxx学校");
            voList.add(vo);
        }
        return AjaxResult.success(voList);
    }

    @ApiOperation("增加机构结点")
    @PostMapping()
    public AjaxResult createOrganization(@RequestBody OrganizationDto organizationDto){
        Organization organization = new Organization();
        BeanUtils.copyProperties(organizationDto, organization);
        organization.setCreateTime(LocalDateTime.now());
        organization.setUpdateTime(LocalDateTime.now());
        organization.setDisabled(0);

        boolean save = iOrganizationService.save(organization);
        if(save == true){
            return AjaxResult.success("增加机构结点成功");
        }else {
            return AjaxResult.error("增加机构结点失败");
        }
    }

    @ApiOperation("删除机构结点")
    @DeleteMapping("/{orgId}")
    public AjaxResult deleteOrganization(@PathVariable Long orgId){
        return iOrganizationService.deleteOrganization(orgId);
    }


}
