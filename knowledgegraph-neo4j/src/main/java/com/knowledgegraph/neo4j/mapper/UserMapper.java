package com.knowledgegraph.neo4j.mapper;

import com.knowledgegraph.common.annotation.DataSource;
import com.knowledgegraph.common.enums.DataSourceType;
import com.knowledgegraph.neo4j.domain.UserModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {

    List<UserModel> getPage(@Param("pageStart") int pageStart, @Param("pageSize") int pageSize, @Param("sort") String sort, @Param("name") String name, @Param("sex") String sex);

    int getPageTotal(@Param("name") String name, @Param("sex") String sex);

    List<Map<String,Object>> getAll();

    List<Map<String,Object>> getTest(@Param("cqlString") String cqlString);

    UserModel getById(@Param("id") Long id);

    int add(@Param("model") UserModel model);

    int update(@Param("model") UserModel model);

    int deleteById(@Param("id") Long id);

}