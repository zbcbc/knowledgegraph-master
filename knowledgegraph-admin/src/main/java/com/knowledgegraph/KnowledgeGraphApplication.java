package com.knowledgegraph;

import com.alibaba.druid.pool.DruidConnectionHolder;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

/**
 * 启动程序
 * 
 * @author ruoyi
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
//@ComponentScan("com.knowledgegraph.*.mapper")
public class KnowledgeGraphApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");

        DruidConnectionHolder.holdabilityUnsupported = true;
        SpringApplication.run(KnowledgeGraphApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  Java知识图谱系统启动成功   ლ(´ڡ`ლ)ﾞ  \n");
    }
}
