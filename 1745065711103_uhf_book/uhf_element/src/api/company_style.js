import request from '@/utils/request'

export default {
	
	selectAxios(params) {
	  return request({
	    url: '/auth/CompanyStyle/select',
	    method: 'post',
	    params
	  })
	},
	addAxios(params) {
	  return request({
	    url: '/auth/CompanyStyle/add',
	    method: 'post',
	    params
	  })
	},
	deleteAxios(id) {
	  return request({
	    url: '/auth/CompanyStyle/delete',
	    method: 'get',
	    params: {
	      id:id
	    }
	  })
	},
	selectByIdAxios(id) {
	  return request({
	    url: '/auth/CompanyStyle/getInfoById',
	    method: 'get',
	    params: {
	      id:id
	    }
	  })
	},
	updateAxios(params) {
	  return request({
	    url: '/auth/CompanyStyle/update',
	    method: 'post',
	    params
	  })
	},
}
