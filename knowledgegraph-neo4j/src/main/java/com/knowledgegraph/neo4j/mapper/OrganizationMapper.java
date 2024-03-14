package com.knowledgegraph.neo4j.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.knowledgegraph.neo4j.pojo.Organization;
import com.knowledgegraph.neo4j.result.vo.OrgExpertVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
/**
 * Author:  Jinzhenliang
 * Date:  2024/3/6 14:41
 */
public interface OrganizationMapper extends BaseMapper<Organization> {
    Organization selectOrganizationByName(@Param("orgName") String orgName);

    List<OrgExpertVo> selectExpertByOrgIDAndRelationship(@Param("orgID") Long orgID,
                                                         @Param("relationship") Integer relationship);

}
