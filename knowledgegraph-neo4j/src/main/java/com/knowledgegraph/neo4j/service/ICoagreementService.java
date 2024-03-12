package com.knowledgegraph.neo4j.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.knowledgegraph.neo4j.pojo.Coagreement;

import java.util.List;

/**
 * Author:  Jinzhenliang
 * Date:  2024/3/12 12:38
 */
public interface ICoagreementService extends IService<Coagreement> {

    List<Coagreement> getCoagreementByOrgId(String orgId);
}
