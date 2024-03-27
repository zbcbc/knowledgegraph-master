package com.knowledgegraph.neo4j.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowledgegraph.neo4j.pojo.Relationship;
import com.knowledgegraph.neo4j.service.RelationshipService;
import com.knowledgegraph.neo4j.mapper.RelationshipMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author zbc
* @description 针对表【relationship】的数据库操作Service实现
* @createDate 2024-03-22 14:47:42
*/
@Service
public class RelationshipServiceImpl extends ServiceImpl<RelationshipMapper, Relationship>
    implements RelationshipService{

}




