import request from '@/utils/request'

// 查询图谱维护列表
export function listGraph(query) {
  return request({
    url: '/neo4j/graph/list',
    method: 'get',
    params: query
  })
}
export function getGraphList(query) {
  return request({
    url: '/neo4j/graph/getList',
    method: 'get',
    params: query
  })
}

export function findIndexGraphKey() {
  return request({
    url: '/neo4j/graph/findIndexGraphKey',
    method: 'get'
  })
}
export function listGraphIndex(query) {
  return request({
    url: '/neo4j/graph/listIndex',
    method: 'get',
    params: query
  })
}

// 根据登陆人查询创建的图谱维护列表
export function getListGraph(query) {
  return request({
    url: '/neo4j/graph/getListGraph',
    method: 'get',
    params: query
  })
}

// 根据登陆人查询管理的图谱维护列表
export function getListGraphByMember(query) {
  return request({
    url: '/neo4j/graph/getListGraphByMember',
    method: 'get',
    params: query
  })
}

// 查询图谱维护详细
export function getGraph(graphKey) {
  return request({
    url: '/neo4j/graph/' + graphKey,
    method: 'get'
  })
}

// 新增图谱维护
export function addGraph(data) {
  return request({
    url: '/neo4j/graph',
    method: 'post',
    data: data
  })
}

// 修改图谱维护
export function updateGraph(data) {
  return request({
    url: '/neo4j/graph',
    method: 'put',
    data: data
  })
}

export function checkGraphUniquens(data) {
  return request({
    url: '/neo4j/graph/check',
    method: 'post',
    data: data
  })
}

// 删除图谱维护
export function delGraph(graphKey) {
  return request({
    url: '/neo4j/graph/' + graphKey,
    method: 'delete'
  })
}
