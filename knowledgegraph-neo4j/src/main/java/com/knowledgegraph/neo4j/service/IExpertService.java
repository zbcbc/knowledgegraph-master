package com.knowledgegraph.neo4j.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.pojo.Expert;

/**
 * ClassName: IExpertService
 * Package: com.knowledgegraph.neo4j.service
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/11 10:03
 * @Version 1.0
 */
public interface IExpertService extends IService<Expert> {
    AjaxResult deleteExpert(Long expertId);

    AjaxResult deleteAreaWithExpert(Long expertId, Long researchAreaId);
}
