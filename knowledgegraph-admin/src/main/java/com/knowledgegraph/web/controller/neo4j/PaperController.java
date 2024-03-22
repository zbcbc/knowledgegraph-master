package com.knowledgegraph.web.controller.neo4j;

import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.pojo.Paper;
import com.knowledgegraph.neo4j.pojo.ResearchAreas;
import com.knowledgegraph.neo4j.service.PaperService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ClassName: PaperController
 * Package: com.knowledgegraph.web.controller.neo4j
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/22 15:05
 * @Version 1.0
 */
@RestController
@RequestMapping("/neo4j/paper")
@Api(value = "以论文为单位的管理接口", tags = "以论文为单位的管理接口")
public class PaperController {
    @Autowired
    PaperService paperService;

    @ApiOperation("增加论文结点")
    @PostMapping()
    public AjaxResult createExpert(@RequestBody Paper paper){
        boolean save = paperService.save(paper);
        if(save == true){
            return AjaxResult.success("增加研究方向结点成功");
        }else {
            return AjaxResult.error("增加研究方向结点失败");
        }
    }

}
