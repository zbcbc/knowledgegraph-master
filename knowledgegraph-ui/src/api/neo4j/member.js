import request from '@/utils/request'

// 查询图谱成员维护列表
export function listMember(query) {
  return request({
    url: '/neo4j/member/list',
    method: 'get',
    params: query
  })
}

// 查询图谱成员维护详细
export function getMember(graphMemberKey) {
  return request({
    url: '/neo4j/member/' + graphMemberKey,
    method: 'get'
  })
}

// 新增图谱成员维护
export function addMember(data) {
  return request({
    url: '/neo4j/member',
    method: 'post',
    data: data
  })
}

// 修改图谱成员维护
export function updateMember(data) {
  return request({
    url: '/neo4j/member',
    method: 'put',
    data: data
  })
}

// 删除图谱成员维护
export function delMember(graphMemberKey) {
  return request({
    url: '/neo4j/member/' + graphMemberKey,
    method: 'delete'
  })
}
