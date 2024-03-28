package com.knowledgegraph.neo4j.pojo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Expert {
  @TableId(value = "id")
  private Long id;

  private String expertName;
  private String expertDeptment;
  private String expertDec;

}
