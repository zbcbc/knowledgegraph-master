import request from '@/utils/request'

// 查询测试图谱列表
export function listTest(query) {
  return request({
    url: '/neo4j/test/list',
    method: 'get',
    params: query
  })
}

// 查询测试图谱详细
export function getTest(neo4jTestKey) {
  return request({
    url: '/neo4j/test/' + neo4jTestKey,
    method: 'get'
  })
}

export function getAllTest() {
  return request({
    url: '/neo4jtest/getAll',
    method: 'get'
  })
}

export function getGraphJsonDataTest() {
  return request({
    url: '/graphJsonData/neo4jTest',
    method: 'get'
  })
}

export function getNeo4jGraphJson(graphKey) {
  return request({
    url: '/graphJsonData/neo4jGraphJson/'+graphKey,
    method: 'get'
  })
}

export function getNeo4jTest(data) {
  return request({
    url: '/neo4jtest/getTest',
    method: 'post',
    data: data
  })
}

// 新增测试图谱
export function addTest(data) {
  return request({
    url: '/neo4j/test',
    method: 'post',
    data: data
  })
}

// 修改测试图谱
export function updateTest(data) {
  return request({
    url: '/neo4j/test',
    method: 'put',
    data: data
  })
}

// 删除测试图谱
export function delTest(neo4jTestKey) {
  return request({
    url: '/neo4j/test/' + neo4jTestKey,
    method: 'delete'
  })
}
