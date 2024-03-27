package com.knowledgegraph.neo4j.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowledgegraph.common.annotation.DataSource;
import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.common.enums.DataSourceType;
import com.knowledgegraph.neo4j.mapper.*;
import com.knowledgegraph.neo4j.pojo.Organization;
import com.knowledgegraph.neo4j.pojo.Paper;
import com.knowledgegraph.neo4j.pojo.Relationship;
import com.knowledgegraph.neo4j.result.dto.AreaPapersDto;
import com.knowledgegraph.neo4j.result.vo.OrgExpertVo;
import com.knowledgegraph.neo4j.result.dto.OrgExpertsDto;
import com.knowledgegraph.neo4j.service.IOrganizationService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Service
@DataSource(value = DataSourceType.MASTER)
public class OrganizationServiceImpl extends ServiceImpl<OrganizationMapper, Organization> implements IOrganizationService {

    @Autowired
    private OrganizationMapper organizationMapper;
    @Autowired
    private ResearchAreasMapper researchAreasMapper;
    @Autowired
    private PaperMapper paperMapper;
    @Autowired
    private RelationshipMapper relationshipMapper;

    @Override
    public Organization getOrganizationByName(String orgName) {

        return organizationMapper.selectOrganizationByName(orgName);
    }

    @Override
    public long getOrganizationByOrgName(String orgName) {
        QueryWrapper<Organization> queryWrapper = new QueryWrapper<Organization>()
                .select("id")
                .eq("org_name", orgName);
        return organizationMapper.selectOne(queryWrapper).getId();
    }

    /**
     * 根据机构id和合作关系查询专家
     *
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
     * 查询属于该组织机构的的国外专家
     *
     * @param orgName
     * @return
     */
    @Override
    public OrgExpertsDto queryExperts(String orgName, Integer relationship) {
        Organization organization = getOrganizationByName(orgName);
        if (organization == null) {
            //throw new RuntimeException("不存在该机构");
            return null;
        }
        long orgId = organization.getId();

        //查询专家列表
        List<OrgExpertVo> expertList = getExpertByOrgIDAndRelationship(orgId, relationship);

        //封装
        OrgExpertsDto orgExpertsDto = new OrgExpertsDto();
        BeanUtils.copyProperties(organization, orgExpertsDto); //封装组织信息
        System.out.println("组织名称：" + orgExpertsDto.getOrgName());
        if (expertList == null || expertList.isEmpty()) {
            return orgExpertsDto;
        }

        ArrayList<OrgExpertVo> resultList = new ArrayList<>();
        //遍历查到的专家列表
        expertList.forEach(item -> {
            OrgExpertVo orgExpertVo = new OrgExpertVo();
            //封装合作名称
            if (item.getRelationshipCategory() == 0) {
                item.setRelationshipName("属于");
            } else if (item.getRelationshipCategory() == 1) {
                item.setRelationshipName("合作");
            } else if (item.getRelationshipCategory() == 2) {
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
        if (organization == null) {
            return null;
        }

        long orgId = organization.getId();
        OrgExpertsDto orgExpertsDto = new OrgExpertsDto();//封装类
        BeanUtils.copyProperties(organization, orgExpertsDto); //封装组织信息
        System.out.println("组织名称：" + orgExpertsDto.getOrgName());

        //========查询该机构的专家列表=======
        List<OrgExpertVo> expertList = getExpertByOrgIDAndRelationship(orgId, relationship);
        if (expertList == null || expertList.isEmpty() || expertList.get(0) == null) {
            return orgExpertsDto;
        }

        //=======查询该机构 该专家的研究方向列表=======
        expertList.forEach(expert -> {
            //封装专家的合作关系和组织名称
            if (expert.getRelationshipCategory() == 0) {
                expert.setRelationshipName("属于");
            } else if (expert.getRelationshipCategory() == 1) {
                expert.setRelationshipName("合作");
            } else if (expert.getRelationshipCategory() == 2) {
                expert.setRelationshipName("到访");
            }
            expert.setOrgName(orgName);

            Long expertId = expert.getId();
            List<AreaPapersDto> areaList = researchAreasMapper.queryAreasByExpertId(expertId);

            //=======查询该专家 该研究方向下的论文列表=======
            if (areaList != null && !areaList.isEmpty() && areaList.get(0) != null) {
                areaList.forEach(areaPapersDto -> {
                    //areaPapersDto.setExpertId(expertId); //结点唯一
                    UUID uuid = UUID.randomUUID();
                    Long uniqueAreaId = uuid.getMostSignificantBits();
                    //areaPapersDto.setId(uniqueAreaId);
                    List<Paper> papers = paperMapper.queryPaperByExpertIdAndAreaId(expertId, areaPapersDto.getId());
                    areaPapersDto.setId(uniqueAreaId);
                    if (papers != null && !papers.isEmpty() && papers.get(0) != null) {
                        areaPapersDto.setPaperList(papers); //将该论文list封装到areaDto
                    }
                });
                expert.setAreasList(areaList); //将该研究方向list封装到expert
            }


        });

        orgExpertsDto.setExpertList(expertList);

        return orgExpertsDto;
    }

    /**
     * 删除机构结点
     * @param orgId
     * @return
     */
    @Override
    public AjaxResult deleteOrganization(Long orgId) {
        //查询该机构是否存在子节点
        List<Relationship> relationships = relationshipMapper.selectList(new LambdaQueryWrapper<Relationship>().eq(Relationship::getOrgId, orgId));
        if(!CollectionUtils.isEmpty(relationships)){
            return AjaxResult.error("该节点下存在子节点");
        }

        int i = organizationMapper.deleteById(orgId);
        if(i <= 0){
            AjaxResult.error("删除机构结点失败");
        }

        return AjaxResult.success("删除机构节点成功");
    }
}
