package com.knowledgegraph.neo4j.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.pojo.Organization;
import com.knowledgegraph.neo4j.result.vo.OrgExpertVo;
import com.knowledgegraph.neo4j.result.dto.OrgExpertsDto;

import java.util.List;

/**
 * Author:  Jinzhenliang
 * Date:  2024/3/6 15:38
 */
public interface IOrganizationService extends IService<Organization> {
    Organization getOrganizationByName(String orgName);

    long getOrganizationByOrgName(String orgName);

    List<OrgExpertVo> getExpertByOrgIDAndRelationship(Long id, Integer relationship);

    OrgExpertsDto queryExperts(String orgName, Integer relationship);

    OrgExpertsDto queryGraph(String orgName, Integer relationship);

    AjaxResult deleteOrganization(Long orgId);
}
