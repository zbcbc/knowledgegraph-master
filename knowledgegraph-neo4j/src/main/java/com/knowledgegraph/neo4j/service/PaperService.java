package com.knowledgegraph.neo4j.service;

import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.pojo.Paper;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author zbc
* @description 针对表【paper】的数据库操作Service
* @createDate 2024-03-14 11:08:51
*/
public interface PaperService extends IService<Paper> {

    AjaxResult deletePaper(Long paperId);
}
