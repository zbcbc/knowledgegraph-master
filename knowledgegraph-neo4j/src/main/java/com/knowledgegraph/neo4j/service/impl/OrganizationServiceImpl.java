package com.knowledgegraph.neo4j.service.impl;

import com.knowledgegraph.common.annotation.DataSource;
import com.knowledgegraph.common.enums.DataSourceType;
import com.knowledgegraph.neo4j.mapper.OrganizationMapper;
import com.knowledgegraph.neo4j.mapper.UserMapper;
import com.knowledgegraph.neo4j.pojo.Expert;
import com.knowledgegraph.neo4j.pojo.Organization;
import com.knowledgegraph.neo4j.result.OrgExpertPo;
import com.knowledgegraph.neo4j.result.OrgExpertsDto;
import com.knowledgegraph.neo4j.service.IOrganizationService;
import com.knowledgegraph.neo4j.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@DataSource(value = DataSourceType.MASTER)
public class OrganizationServiceImpl implements IOrganizationService {

    @Autowired
    private OrganizationMapper organizationMapper;

    @Override
    public Organization getOrganizationByName(String orgName) {
        return organizationMapper.selectOrganizationByName(orgName);
    }

    @Override
    public List<Expert> getExpertByOrgID(Long id) {
        return organizationMapper.selectExpertByOrgID(id);
    }

    /**
     *  查询属于该组织机构的的国外专家
     * @param orgName
     * @return
     */
    @Override
    public OrgExpertsDto queryExperts(String orgName) {
        Organization organization = getOrganizationByName(orgName);

        long orgId = organization.getId();

        //查询专家列表
        List<Expert> expertList = getExpertByOrgID(orgId);

        //封装
        OrgExpertsDto orgExpertsDto = new OrgExpertsDto();
        BeanUtils.copyProperties(organization, orgExpertsDto);
        System.out.println("组织名称："+orgExpertsDto.getOrgName());

        ArrayList<OrgExpertPo> resultList = new ArrayList<>();
        expertList.forEach( item ->{
            OrgExpertPo orgExpertPo = new OrgExpertPo();
            BeanUtils.copyProperties(item, orgExpertPo);
            orgExpertPo.setOrgName(orgName);
            resultList.add(orgExpertPo);
        });

        orgExpertsDto.setExpertList(new ArrayList<>(resultList));
        System.out.println(orgExpertsDto);
        return orgExpertsDto;
    }
}
