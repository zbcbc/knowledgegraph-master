package com.knowledgegraph.neo4j.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.mapper.ExpertPaperMapper;
import com.knowledgegraph.neo4j.pojo.ExpertPaper;
import com.knowledgegraph.neo4j.pojo.Paper;
import com.knowledgegraph.neo4j.service.PaperService;
import com.knowledgegraph.neo4j.mapper.PaperMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @author zbc
* @description 针对表【paper】的数据库操作Service实现
* @createDate 2024-03-14 11:08:51
*/
@Service
public class PaperServiceImpl extends ServiceImpl<PaperMapper, Paper>
    implements PaperService{
    @Autowired
    PaperMapper paperMapper;
    @Autowired
    ExpertPaperMapper expertPaperMapper;

    @Transactional
    @Override
    public AjaxResult deletePaper(Long paperId) {
        if(paperId == null){
            return AjaxResult.error("paperId不能为空");
        }
        //删除论文和研究方向、专家的关系
        expertPaperMapper.delete(new LambdaQueryWrapper<ExpertPaper>().eq(ExpertPaper::getPaperId, paperId));

        //删除论文
        paperMapper.deleteById(paperId);
        return AjaxResult.success("删除成功");
    }
}




