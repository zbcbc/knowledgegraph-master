import request from '@/utils/request'

export function getLineChart() {
    return request({
      url: '/neo4j/dataStatis/lineChart',
      method: 'get'
    })
  }