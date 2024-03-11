import request from '@/utils/request'

// 查询关系维护列表
export function listRelationship(query) {
  return request({
    url: '/neo4j/relationship/list',
    method: 'get',
    params: query
  })
}

// 查询关系维护详细
export function getRelationship(graphRelationshipId) {
  return request({
    url: '/neo4j/relationship/' + graphRelationshipId,
    method: 'get'
  })
}

// 新增关系维护
export function addRelationship(data) {
  return request({
    url: '/neo4j/relationship',
    method: 'post',
    data: data
  })
}

// 修改关系维护
export function updateRelationship(data) {
  return request({
    url: '/neo4j/relationship',
    method: 'put',
    data: data
  })
}

// 删除关系维护
export function delRelationship(graphRelationshipId) {
  return request({
    url: '/neo4j/relationship/' + graphRelationshipId,
    method: 'delete'
  })
}
