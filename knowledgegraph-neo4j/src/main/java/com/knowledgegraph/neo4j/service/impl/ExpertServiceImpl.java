package com.knowledgegraph.neo4j.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.mapper.*;
import com.knowledgegraph.neo4j.pojo.*;
import com.knowledgegraph.neo4j.result.dto.CreateAreaDto;
import com.knowledgegraph.neo4j.service.IExpertService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * ClassName: ExpertServiceImpl
 * Package: com.knowledgegraph.neo4j.service.impl
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/11 10:03
 * @Version 1.0
 */
@Slf4j
@Service
public class ExpertServiceImpl extends ServiceImpl<ExpertMapper, Expert> implements IExpertService {

    @Autowired
    ExpertAreasMapper expertAreasMapper;
    @Autowired
    ExpertPaperMapper expertPaperMapper;
    @Autowired
    RelationshipMapper relationshipMapper;
    @Autowired
    ExpertMapper expertMapper;
    @Autowired
    ResearchAreasMapper researchAreasMapper;


    /**
     * 删除专家
     * @param expertId
     * @return
     */
    @Transactional
    @Override
    public AjaxResult deleteExpert(Long expertId) {
        //删除该专家，要删除该专家关联的研究方向 并删除该专家研究方向下的论文
        if(expertId == null)
            return  AjaxResult.error("该专家id为空");
        //1. 删除该专家的研究方向
        expertAreasMapper.delete(new LambdaQueryWrapper<ExpertAreas>().eq(ExpertAreas::getExpertId, expertId));
        //2. 删除该专家的论文
        expertPaperMapper.delete(new LambdaQueryWrapper<ExpertPaper>().eq(ExpertPaper::getExpertId, expertId));
        //3. 移除专家和机构的关系
        relationshipMapper.delete(new LambdaQueryWrapper<Relationship>().eq(Relationship::getExpertId, expertId));
        //4. 删除专家
        expertMapper.delete(new LambdaQueryWrapper<Expert>().eq(Expert::getId, expertId));
        return AjaxResult.success("删除专家结点成功");
    }

    /**
     * 删除某专家的某研究方向
     * @param expertId
     * @param researchAreaId
     * @return
     */
    @Transactional
    @Override
    public AjaxResult deleteAreaWithExpert(Long expertId, Long researchAreaId) {
        if(expertId == null || researchAreaId == null){
            return AjaxResult.error("id不能为空");
        }
        //删除该专家的该研究方向
        expertAreasMapper.delete(new LambdaQueryWrapper<ExpertAreas>().eq(ExpertAreas::getExpertId, expertId)
                .eq(ExpertAreas::getResearchAreaId, researchAreaId));

        //查询是否还存在专家有该研究方向 如果没有 就将该研究方向实体删除
        List<ExpertAreas> expertAreas = expertAreasMapper.selectList(new LambdaQueryWrapper<ExpertAreas>().eq(ExpertAreas::getResearchAreaId, researchAreaId));
        if(CollectionUtils.isEmpty(expertAreas)){
            researchAreasMapper.deleteById(researchAreaId);
        }
        return AjaxResult.success("删除成功");
    }

    /**
     * 增加该专家的研究方向
     * @param createAreaDto
     * @return
     */
    @Transactional
    @Override
    public AjaxResult createAreaWithExpert(CreateAreaDto createAreaDto) {
        String areaName = createAreaDto.getAreaName();
        Long expertId = createAreaDto.getExpertId();

        //查询研究方向表中是否存在该研究方向
        ResearchAreas area = researchAreasMapper.selectOne(new LambdaQueryWrapper<ResearchAreas>().eq(ResearchAreas::getAreaName, areaName));

        //不存在 新增area表
        Long areaId = null;
        if(area == null){
            ResearchAreas area1 = new ResearchAreas();
            area1.setAreaName(areaName);
            int i = researchAreasMapper.insert(area1);
            if(i <= 0){
                return AjaxResult.error("新增研究方向结点‘" + areaName + "’失败!");
            }
            areaId = area1.getId();
        }else{
            areaId = area.getId();
        }

        //查询该专家是否已存在该研究方向
        ExpertAreas expertAreas = expertAreasMapper.selectOne(new LambdaQueryWrapper<ExpertAreas>().eq(ExpertAreas::getExpertId, expertId)
                .eq(ExpertAreas::getResearchAreaId, areaId));
        //不存在 新增expert_area关系表
        if(expertAreas == null){
            ExpertAreas expertAreas1 = new ExpertAreas();
            expertAreas1.setExpertId(expertId);
            expertAreas1.setResearchAreaId(areaId);
            int i = expertAreasMapper.insert(expertAreas1);
            if(i <= 0){
                return AjaxResult.error("该专家新增研究方向‘" + areaName + "’失败!");
            }
        }else{
            return AjaxResult.error("该专家已存在研究方向‘" + areaName + "’,无需添加!");
        }

        return AjaxResult.success("该专家新增研究方向‘" + areaName + "’成功!");
    }

}
