package com.knowledgegraph.neo4j.pojo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Expert {

  private long id;
  private String expertName;
  private String expertDeptment;
  private String expertDec;

}
