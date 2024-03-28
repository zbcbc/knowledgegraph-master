package com.knowledgegraph.neo4j.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.mapper.*;
import com.knowledgegraph.neo4j.pojo.*;
import com.knowledgegraph.neo4j.result.dto.CreatePaperDto;
import com.knowledgegraph.neo4j.service.ResearchAreasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @author zbc
* @description 针对表【research_areas】的数据库操作Service实现
* @createDate 2024-03-14 11:08:51
*/
@Service
public class ResearchAreasServiceImpl extends ServiceImpl<ResearchAreasMapper, ResearchAreas>
    implements ResearchAreasService{

    @Autowired
    ExpertMapper expertMapper;
    @Autowired
    ExpertAreasMapper expertAreasMapper;
    @Autowired
    PaperMapper paperMapper;
    @Autowired
    ExpertPaperMapper expertPaperMapper;
    /**
     * 增加某专家某研究方向下的论文
     * @param createPaperDto
     * @return
     */
    @Transactional
    @Override
    public AjaxResult createPaperWithExpertAndArea(CreatePaperDto createPaperDto) {
        Long expertId = createPaperDto.getExpertId();
        Long areaId = createPaperDto.getAreaId();
        //查询是否有该专家
        Expert expert = expertMapper.selectById(expertId);
        if(expert == null){
            return AjaxResult.error("不存在该专家");
        }
        //查询是否有该专家该研究方向
        ExpertAreas expertAreas = expertAreasMapper.selectOne(new LambdaQueryWrapper<ExpertAreas>().eq(ExpertAreas::getExpertId, expertId)
                .eq(ExpertAreas::getResearchAreaId, areaId));
        if(expertAreas == null){
            return AjaxResult.error("该专家不存在该研究方向");
        }

        //查询是否已经存在该论文,如果没有就新增，有就只新增关系
        String title = createPaperDto.getTitle();
        Long publicationYear = createPaperDto.getPublicationYear();
        String journal = createPaperDto.getConferenceJournal();

        Paper paper = paperMapper.selectOne(new LambdaQueryWrapper<Paper>().eq(Paper::getTitle, title)
                .eq(Paper::getPublicationYear, publicationYear)
                .eq(Paper::getConferenceJournal, journal));
        Long paperId = null;
        if(paper == null){
            Paper paper1 = new Paper();
            paper1.setTitle(title);
            paper1.setPublicationYear(publicationYear);
            paper1.setConferenceJournal(journal);
            int i = paperMapper.insert(paper1);
            if(i <= 0){
                return AjaxResult.error("新增该论文结点失败");
            }
            paperId = paper1.getId();
        }else{
            paperId = paper.getId();
        }

        ExpertPaper expertPaper = new ExpertPaper();
        expertPaper.setExpertId(expertId);
        expertPaper.setPaperId(paperId);
        expertPaper.setAreaId(areaId);
        int i = expertPaperMapper.insert(expertPaper);

        if(i <= 0){
            return AjaxResult.error("新增该专家该研究方向的论文失败");
        }
        return AjaxResult.success("新增该专家该研究方向的论文成功");
    }
}




