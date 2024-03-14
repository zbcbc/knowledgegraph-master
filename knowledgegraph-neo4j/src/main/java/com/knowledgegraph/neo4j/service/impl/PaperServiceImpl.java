package com.knowledgegraph.neo4j.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowledgegraph.neo4j.pojo.Paper;
import com.knowledgegraph.neo4j.service.PaperService;
import com.knowledgegraph.neo4j.mapper.PaperMapper;
import org.springframework.stereotype.Service;

/**
* @author zbc
* @description 针对表【paper】的数据库操作Service实现
* @createDate 2024-03-14 11:08:51
*/
@Service
public class PaperServiceImpl extends ServiceImpl<PaperMapper, Paper>
    implements PaperService{

}




