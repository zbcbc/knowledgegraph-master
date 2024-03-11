package com.knowledgegraph.neo4j.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowledgegraph.neo4j.mapper.ExpertMapper;
import com.knowledgegraph.neo4j.pojo.Expert;
import com.knowledgegraph.neo4j.service.IExpertService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
