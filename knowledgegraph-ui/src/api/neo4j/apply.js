import request from '@/utils/request'

// 查询申请审核列表
export function listApply(query) {
  return request({
    url: '/neo4j/apply/list',
    method: 'get',
    params: query
  })
}

//查询我的申请
export function listMyApply(query) {
  return request({
    url: '/neo4j/apply/listMy',
    method: 'get',
    params: query
  })
}

// 查询申请审核详细
export function getApply(applyKey) {
  return request({
    url: '/neo4j/apply/' + applyKey,
    method: 'get'
  })
}

// 新增申请审核
export function addApply(data) {
  return request({
    url: '/neo4j/apply',
    method: 'post',
    data: data
  })
}

// 修改申请审核
export function updateApply(data) {
  return request({
    url: '/neo4j/apply',
    method: 'put',
    data: data
  })
}

// 删除申请审核
export function delApply(applyKey) {
  return request({
    url: '/neo4j/apply/' + applyKey,
    method: 'delete'
  })
}
