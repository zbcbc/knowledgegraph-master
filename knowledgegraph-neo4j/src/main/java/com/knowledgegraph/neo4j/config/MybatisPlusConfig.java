package com.knowledgegraph.neo4j.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * ClassName: MybatisPlusConfig
 * Package: com.knowledgegraph.neo4j.config
 * Description:
 *
 * @Author zbc
 * @Create 2024/3/11 13:05
 * @Version 1.0
 */
@Configuration
@MapperScan("com.knowledgegraph.neo4j.mapper")
public class MybatisPlusConfig {

}
