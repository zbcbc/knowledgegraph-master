package com.knowledgegraph.neo4j.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.knowledgegraph.neo4j.mapper.CoagreementMapper;
import com.knowledgegraph.neo4j.pojo.Coagreement;
import com.knowledgegraph.neo4j.service.ICoagreementService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Author:  Jinzhenliang
 * Date:  2024/3/12 12:37
 */
@Slf4j
@Service
public class CoagreementServiceImpl extends ServiceImpl<CoagreementMapper, Coagreement> implements ICoagreementService {

    @Autowired CoagreementMapper coagreementMapper;

    @Override
    public List<Coagreement> getCoagreementByOrgId(long orgId,int agreementType) {
        QueryWrapper<Coagreement> queryWrapper = new QueryWrapper<Coagreement>()
                .select()
                .eq("organization_id",orgId)
                .eq("agreement_type",agreementType);
        return coagreementMapper.selectList(queryWrapper);
    }
}
