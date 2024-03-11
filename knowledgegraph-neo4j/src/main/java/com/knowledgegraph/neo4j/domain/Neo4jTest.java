package com.knowledgegraph.neo4j.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.knowledgegraph.common.annotation.Excel;
import com.knowledgegraph.common.core.domain.BaseEntity;

/**
 * 测试图谱对象 neo4j_test
 * 
 * @author ruoyi
 * @date 2022-03-24
 */
public class Neo4jTest extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 测试图谱主键 */
    @Excel(name = "测试图谱主键")
    private String neo4jTestKey;

    /** 测试图谱名称 */
    @Excel(name = "测试图谱名称")
    private String neo4jTestName;

    public void setNeo4jTestKey(String neo4jTestKey) 
    {
        this.neo4jTestKey = neo4jTestKey;
    }

    public String getNeo4jTestKey() 
    {
        return neo4jTestKey;
    }
    public void setNeo4jTestName(String neo4jTestName) 
    {
        this.neo4jTestName = neo4jTestName;
    }

    public String getNeo4jTestName() 
    {
        return neo4jTestName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("neo4jTestKey", getNeo4jTestKey())
            .append("neo4jTestName", getNeo4jTestName())
            .toString();
    }
}
