package com.knowledgegraph.neo4j.pojo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Relationship {

  private long id;
  private long category;
  private long orgId;
  private long expertId;

}
