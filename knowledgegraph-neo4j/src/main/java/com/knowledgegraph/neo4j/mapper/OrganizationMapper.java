package com.knowledgegraph.neo4j.mapper;

import com.knowledgegraph.neo4j.pojo.Expert;
import com.knowledgegraph.neo4j.pojo.Organization;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * Author:  Jinzhenliang
 * Date:  2024/3/6 14:41
 */
public interface OrganizationMapper {
    Organization selectOrganizationByName(@Param("orgName") String orgName);

    List<Expert> selectExpertByOrgID(@Param("orgID") Long orgID);

}
