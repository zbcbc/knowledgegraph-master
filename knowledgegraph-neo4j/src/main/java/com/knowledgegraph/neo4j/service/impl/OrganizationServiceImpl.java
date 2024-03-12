package com.knowledgegraph.neo4j.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowledgegraph.common.annotation.DataSource;
import com.knowledgegraph.common.core.domain.AjaxResult;
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
public class OrganizationServiceImpl extends ServiceImpl<OrganizationMapper,Organization> implements IOrganizationService {

    @Autowired
    private OrganizationMapper organizationMapper;

    @Override
    public Organization getOrganizationByName(String orgName) {

        return organizationMapper.selectOrganizationByName(orgName);
    }

    @Override
    public long getOrganizationByOrgName(String orgName) {
        QueryWrapper<Organization> queryWrapper = new QueryWrapper<Organization>()
                .select("id")
                .eq("org_name",orgName);
        return organizationMapper.selectOne(queryWrapper).getId();
    }

    @Override
    public List<OrgExpertPo> getExpertByOrgIDAndRelationship(Long id, Integer relationship) {
        //关系 0：属于；1：合作；2：到访
            return organizationMapper.selectExpertByOrgIDAndRelationship(id, relationship);

    }

    /**
     *  查询属于该组织机构的的国外专家
     * @param orgName
     * @return
     */
    @Override
    public OrgExpertsDto queryExperts(String orgName, Integer relationship) {
        Organization organization = getOrganizationByName(orgName);

        long orgId = organization.getId();

        //查询专家列表
        List<OrgExpertPo> expertList = getExpertByOrgIDAndRelationship(orgId, relationship);

        //封装
        OrgExpertsDto orgExpertsDto = new OrgExpertsDto();
        BeanUtils.copyProperties(organization, orgExpertsDto); //封装组织信息
        System.out.println("组织名称："+orgExpertsDto.getOrgName());

        ArrayList<OrgExpertPo> resultList = new ArrayList<>();
        //遍历查到的专家列表
        expertList.forEach( item ->{
            OrgExpertPo orgExpertPo = new OrgExpertPo();
            //封装合作名称
            if(item.getRelationshipCategory() == 0){
                item.setRelationshipName("属于");
            }else if(item.getRelationshipCategory() == 1){
                item.setRelationshipName("合作");
            }else if(item.getRelationshipCategory() == 2){
                item.setRelationshipName("到访");
            }
            BeanUtils.copyProperties(item, orgExpertPo);
            orgExpertPo.setOrgName(orgName);

            resultList.add(orgExpertPo);
        });

        orgExpertsDto.setExpertList(new ArrayList<>(resultList));
        System.out.println(orgExpertsDto);
        return orgExpertsDto;
    }
}
