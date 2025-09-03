import request from '@/utils/request'
import { getToken } from '@/utils/auth';
export default {
	admin_user_list( ) {
		return request({
			url: '/auth/admin_user_list',
			method: 'get',
			params: {
			}
		})
	},
	delUserAxios( uid) {
		return request({
			url: '/auth/deleteUser',
			method: 'get',
			params: {
				delUid: uid,
        token:getToken()
			}
		})
	},

  deleteGood( delGid) {
  	return request({
  		url: '/auth/deleteGood',
  		method: 'get',
  		params: {
  			delGid: delGid,
        token:getToken()
  		}
  	})
  },
  getSortChart( ) {
  	return request({
  		url: '/auth/echart/getSortChart',
  		method: 'get',
  		params: {
        token:getToken()
  		}
  	})
  },
  getBookCountByUid( ) {
  	return request({
  		url: '/auth/echart/getBookCountByUid',
  		method: 'get',
  		params: {
        token:getToken()
  		}
  	})
  },

  getRfif() {
  	return request({
  		url: '/auth/book/rfid/getRfid',
  		method: 'get',
  		params: {
  			token: getToken(),
  		}
  	})
  },
	getUserInfoByUidAxios( uid) {
		return request({
			url: '/auth/getUserInfoByUid',
			method: 'get',
			params: {
				userUId: uid,
        token:getToken()
			}
		})
	},
  getUserInfoByUidAxios( uid) {
  	return request({
  		url: '/auth/getUserInfoByUid',
  		method: 'get',
  		params: {
  			userUId: uid,
        token:getToken()
  		}
  	})
  },
  paySubmit( payId,payAmt) {
  	return request({
  		url: '/auth/pay',
  		method: 'get',
  		params: {
  			payId: payId,
  			payAmt: payAmt,
        token:getToken()
  		}
  	})
  },

	get_limit_info( lid) {
		return request({
			url: '/auth/get_limit_info',
			method: 'get',
			params: {
				lid: lid
			}
		})
	},

	updateUserInfoAxios(uid,uname,phone,age,rfid){
		return request({
			url: '/auth/updateUserAllInfo',
			method: 'get',
			params: {
				changeId: uid,
				uname:uname,
				phone:phone,
				age:age,
				rfid:rfid,
        token:getToken()
			}
		})
	},
//changeId, String gname, String gsort, String gbalance, String rfid
	updateGoodAllInfo(changeId,gname,gsort,gbalance,rfid){
		return request({
			url: '/auth/updateGoodAllInfo',
			method: 'get',
			params: {
				changeId: changeId,
				gname:gname,
				gsort:gsort,
				gbalance:gbalance,
				rfid:rfid,
        token:getToken()
			}
		})
	},
  // String uname, String phone,String age,String rfid
	addUserAxios(uname,phone,age,rfid){
		return request({
			url: '/auth/add_user',
			method: 'get',
			params: {
				uname:uname,
				phone:phone,
				age:age,
				rfid:rfid,
        token:getToken()
			}
		})
	},
// gname, String gsort, String gbalance, String rfid
	add_goods(gname,gsort,gbalance,rfid){
		return request({
			url: '/auth/add_goods',
			method: 'get',
			params: {
				gname:gname,
				gsort:gsort,
				gbalance:gbalance,
				rfid:rfid,
        token:getToken()
			}
		})
	},
  getUserListByConditionAxios(username,phone,page,limit){
  	return request({
  		url: '/auth/getUserListByCondition',
  		method: 'get',
  		params: {
  			username:username,
  			phone:phone,
  			page:page,
  			limit:limit,
        token:getToken()
  		}
  	})
  },

  getGoodInfoByUid(gid){
  	return request({
  		url: '/auth/getGoodInfoByUid',
  		method: 'get',
  		params: {
  			gid:gid,
        token:getToken()
  		}
  	})
  },

  getGoodListByCondition(gname,page,limit){
  	return request({
  		url: '/auth/getGoodListByCondition',
  		method: 'get',
  		params: {
  			gname:gname,
  			page:page,
  			limit:limit,
        token:getToken()
  		}
  	})
  },

  getHistoryListByCondition(gname,uname,page,limit){
  	return request({
  		url: '/auth/getHistoryListByCondition',
  		method: 'get',
  		params: {
  			gname:gname,
  			uname:uname,
  			page:page,
  			limit:limit,
        token:getToken()
  		}
  	})
  },

	//获取历史数据
	getHistData(page){
		return request({
			url: '/auth/get_rfid_history',
			method: 'get',
			params: {
				page:page,
			}
		})
	},

	//意见反馈
	commentsSet(cname,cphone,cMsg){
		return request({
			url: '/auth/comments_set',
			method: 'get',
			params: {
				cname:cname,
				cphone:cphone,
				cMsg:cMsg
			}
		})
	},
	//获取意见反馈内容
	getCommentsData(page){
		return request({
			url: '/auth/comments_get',
			method: 'get',
			params: {
				page:page,
			}
		})
	},
	//获取操作记录
	getOperationData(page){
		return request({
			url: '/auth/get_operation',
			method: 'get',
			params: {
				page:page,
			}
		})
	},
	//获取操作记录
	getWarningData(page){
		return request({
			url: '/auth/get_warning',
			method: 'get',
			params: {
				page:page,
			}
		})
	},
	//根据id删除
	delWarningAxios(id) {
		return request({
			url: '/auth/del_warning',
			method: 'get',
			params: {
				id: id
			}
		})
	},
	//获取实时数据
	getCurrData() {
		return request({
			url: '/auth/get_curr_data',
			method: 'get',
			params: {
			}
		})
	},
	//设备控制get
	getContro() {
		return request({
			url: '/auth/get_con',
			method: 'get',
			params: {
			}
		})
	},
	//设备控制set
	setContro(name,value) {
		return request({
			url: '/auth/set_con',
			method: 'get',
			params: {
				name:name,
				value:value
			}
		})
	},
	//用户注册
	register(uname,upwd,rname,email,phone) {
		return request({
			url: '/auth/register',
			method: 'get',
			params: {
				uname:uname,
				upwd:upwd,
				rname:rname,
				email:email,
				phone:phone
			}
		})
	},

	get_Curr_Chart(param){
		return request({
			url: '/auth/get_Curr_Chart',
			method: 'get',
			params: {
				param:param,
			}
		})
	},
	get_hist_Chart(param){
		return request({
			url: '/auth/get_hist_Chart',
			method: 'get',
			params: {
				param:param,
			}
		})
	},

	scene_update(sid){
		return request({
			url: '/auth/scene_update',
			method: 'get',
			params: {
				sid:sid,
			}
		})
	},

	get_user_option(){
		return request({
			url: '/auth/get_user_option',
			method: 'get',
			params: {
			}
		})
	},
	get_did_option(){
		return request({
			url: '/auth/get_did_option',
			method: 'get',
			params: {
			}
		})
	},

	update_rfid_uif(uid,rfid){
		return request({
			url: '/auth/update_rfid_uif',
			method: 'get',
			params: {
				usid:uid,
				rfid:rfid
			}
		})
	},
	update_balance(uid,balance){
		return request({
			url: '/auth/update_balance',
			method: 'get',
			params: {
				usid:uid,
				balance:balance
			}
		})
	},
	update_limit(lid,limit){
		return request({
			url: '/auth/update_limit',
			method: 'get',
			params: {
				lid:lid,
				limit:limit
			}
		})
	},

	update_user_stat(uid,nstat){
		return request({
			url: '/auth/update_user_stat',
			method: 'get',
			params: {
				usid:uid,
				nstat:nstat
			}
		})
	},
}
