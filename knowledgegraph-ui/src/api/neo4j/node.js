import request from '@/utils/request'

// 查询节点维护列表
export function listNode(query) {
  return request({
    url: '/neo4j/node/list',
    method: 'get',
    params: query
  })
}

//根据图谱查询节点
export function listNodeByGraphKey(query) {
  return request({
    url: '/neo4j/node/listByGraphKey',
    method: 'get',
    params: query
  })
}

// 查询节点维护详细
export function getNode(graphNodeKey) {
  return request({
    url: '/neo4j/node/' + graphNodeKey,
    method: 'get'
  })
}

// 新增节点维护
export function addNode(data) {
  return request({
    url: '/neo4j/node',
    method: 'post',
    data: data
  })
}

// 修改节点维护
export function updateNode(data) {
  return request({
    url: '/neo4j/node',
    method: 'put',
    data: data
  })
}

// 删除节点维护
export function delNode(graphNodes) {
  console.log(graphNodes)
  return request({
    url: '/neo4j/node/delNode',
    method: 'post',
    data: graphNodes
  })
}
