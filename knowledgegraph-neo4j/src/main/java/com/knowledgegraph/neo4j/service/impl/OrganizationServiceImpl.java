package com.knowledgegraph.neo4j.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowledgegraph.common.annotation.DataSource;
import com.knowledgegraph.common.enums.DataSourceType;
import com.knowledgegraph.neo4j.mapper.ExpertMapper;
import com.knowledgegraph.neo4j.mapper.OrganizationMapper;
import com.knowledgegraph.neo4j.pojo.Organization;
import com.knowledgegraph.neo4j.result.vo.OrgExpertVo;
import com.knowledgegraph.neo4j.result.dto.OrgExpertsDto;
import com.knowledgegraph.neo4j.service.IOrganizationService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@DataSource(value = DataSourceType.MASTER)
public class OrganizationServiceImpl extends ServiceImpl<OrganizationMapper,Organization> implements IOrganizationService {

    @Autowired
    private OrganizationMapper organizationMapper;
    @Autowired
    private ExpertMapper expertMapper;

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

    /**
     * 根据机构id和合作关系查询专家
     * @param id
     * @param relationship
     * @return
     */
    @Override
    public List<OrgExpertVo> getExpertByOrgIDAndRelationship(Long id, Integer relationship) {
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
        if(organization == null){
            throw new RuntimeException("不存在该机构");
        }

        long orgId = organization.getId();

        //查询专家列表
        List<OrgExpertVo> expertList = getExpertByOrgIDAndRelationship(orgId, relationship);

        //封装
        OrgExpertsDto orgExpertsDto = new OrgExpertsDto();

        BeanUtils.copyProperties(organization, orgExpertsDto); //封装组织信息

        System.out.println("组织名称："+orgExpertsDto.getOrgName());

        ArrayList<OrgExpertVo> resultList = new ArrayList<>();
        //遍历查到的专家列表
        expertList.forEach( item ->{
            OrgExpertVo orgExpertVo = new OrgExpertVo();
            //封装合作名称
            if(item.getRelationshipCategory() == 0){
                item.setRelationshipName("属于");
            }else if(item.getRelationshipCategory() == 1){
                item.setRelationshipName("合作");
            }else if(item.getRelationshipCategory() == 2){
                item.setRelationshipName("到访");
            }
            BeanUtils.copyProperties(item, orgExpertVo);
            orgExpertVo.setOrgName(orgName);

            resultList.add(orgExpertVo);
        });

        orgExpertsDto.setExpertList(new ArrayList<>(resultList));
        System.out.println(orgExpertsDto);
        return orgExpertsDto;
    }

    @Override
    public OrgExpertsDto queryGraph(String orgName, Integer relationship) {
        Organization organization = getOrganizationByName(orgName);
        if(organization == null){
            throw new RuntimeException("不存在该机构");
        }

        long orgId = organization.getId();

        //========查询该机构的专家列表=======
        List<OrgExpertVo> expertList = getExpertByOrgIDAndRelationship(orgId, relationship);

        //=======查询该机构 该专家的研究方向列表=======
//        expertList.forEach(expert -> {
//
//        });

        //=======查询该专家 该研究方向下的论文列表=======

        return null;
    }
}
