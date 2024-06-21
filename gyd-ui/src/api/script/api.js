import request from '@/utils/request'

// 查询网站接口信息列表
export function listApi(query) {
  return request({
    url: '/script/api/list',
    method: 'get',
    params: query
  })
}

// 查询网站接口信息详细
export function getApi(apiId) {
  return request({
    url: '/script/api/' + apiId,
    method: 'get'
  })
}

// 新增网站接口信息
export function addApi(data) {
  return request({
    url: '/script/api',
    method: 'post',
    data: data
  })
}

// 修改网站接口信息
export function updateApi(data) {
  return request({
    url: '/script/api',
    method: 'put',
    data: data
  })
}

// 删除网站接口信息
export function delApi(apiId) {
  return request({
    url: '/script/api/' + apiId,
    method: 'delete'
  })
}

// 删除网站接口信息
export function execApi(data) {
  return request({
    url: '/script/api/exec',
    method: 'post',
    data: data
  })
}


