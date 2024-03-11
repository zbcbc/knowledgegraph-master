import request from '@/utils/request'

// 查询节点视频资源列表
export function listVideo(query) {
  return request({
    url: '/neo4j/video/list',
    method: 'get',
    params: query
  })
}

// 查询节点视频资源详细
export function getVideo(graphNodeVideoKey) {
  return request({
    url: '/neo4j/video/' + graphNodeVideoKey,
    method: 'get'
  })
}

// 新增节点视频资源
export function addVideo(data) {
  return request({
    url: '/neo4j/video',
    method: 'post',
    data: data
  })
}

// 修改节点视频资源
export function updateVideo(data) {
  return request({
    url: '/neo4j/video',
    method: 'put',
    data: data
  })
}

// 删除节点视频资源
export function delVideo(graphNodeVideoKey) {
  return request({
    url: '/neo4j/video/' + graphNodeVideoKey,
    method: 'delete'
  })
}
