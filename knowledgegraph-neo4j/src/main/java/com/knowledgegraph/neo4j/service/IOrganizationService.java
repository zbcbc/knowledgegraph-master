package com.knowledgegraph.neo4j.service;

import com.knowledgegraph.neo4j.pojo.Expert;
import com.knowledgegraph.neo4j.pojo.Organization;
import com.knowledgegraph.neo4j.result.OrgExpertPo;
import com.knowledgegraph.neo4j.result.OrgExpertsDto;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * Author:  Jinzhenliang
 * Date:  2024/3/6 15:38
 */
public interface IOrganizationService {
    Organization getOrganizationByName(String orgName);

    List<OrgExpertPo> getExpertByOrgIDAndRelationship(Long id, Integer relationship);

    OrgExpertsDto queryExperts(String orgName, Integer relationship);
}
