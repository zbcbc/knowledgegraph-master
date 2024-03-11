package com.knowledgegraph.web.controller.neo4j;

import com.knowledgegraph.common.core.domain.AjaxResult;
import com.knowledgegraph.neo4j.mapper.UserMapper;
import com.knowledgegraph.neo4j.domain.UserModel;
import com.knowledgegraph.neo4j.result.PageParam;
import com.knowledgegraph.neo4j.result.PageResult;
//import org.json.JSONObject;
import com.knowledgegraph.neo4j.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/neo4jtest")
public class UserController {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserService userService;

//    /**
//     * 分页条件查询
//     * 参数例：{"pageIndex":1,"pageSize":2,"sort":"u.sex desc","condition":"{'name':'','sex':'男'}"}
//     *
//     * @param pageParam
//     * @return
//     */
//    @PostMapping("/getPage")
//    public PageResult getPage(@RequestBody PageParam pageParam) {
//        int pageStart = pageParam.getPageStart();
//        int pageIndex = pageParam.getPageIndex();
//        int pageSize = pageParam.getPageSize();
//        String sort = pageParam.getSort();
//
//        JSONObject jsonObject = new JSONObject(pageParam.getCondition());
//        String name = ".*" + jsonObject.getString("name") + ".*"; //模糊查询
//        String sex = jsonObject.getString("sex");
//
//        List<UserModel> models = userMapper.getPage(pageStart, pageSize, sort, name, sex);
//        int total = userMapper.getPageTotal(name, sex);
//        PageResult pageResult = new PageResult(pageIndex, pageSize, total, models);
//
//        return pageResult;
//    }

    @GetMapping("/getAll")
    public AjaxResult getAll() {
        List<Map<String,Object>> models = userMapper.getAll();
        return AjaxResult.success(models);
    }

    @PostMapping("/getTest")
    public AjaxResult getTest(@RequestBody String cqlString) {
        List<Map<String,Object>> data = userService.getTest(cqlString);
        return AjaxResult.success(data);
    }

    /**
     * 根据id查询（含节点关系）
     *
     * @param id
     * @return
     */
    @GetMapping("/getById/{id}")
    public UserModel getById(@PathVariable Long id) {
        UserModel model = userMapper.getById(id);
        return model;
    }

    @PostMapping("/add")
    public int add(@RequestBody UserModel model) {
        int i = userMapper.add(model);
        return i;
    }

    @PostMapping("/update")
    public int update(@RequestBody UserModel model) {
        int i = userMapper.update(model);
        return i;
    }

    @DeleteMapping("/deleteById/{id}")
    public int deleteById(@PathVariable Long id) {
        int i = userMapper.deleteById(id);
        return i;
    }

}
