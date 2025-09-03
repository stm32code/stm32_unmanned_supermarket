import request from '@/utils/request'

export default {
	selectAxios( page, size,inOutNo) {
		return request({
			url: '/auth/GoodsHandle/getBatchNoList',
			method: 'get',
			params: {
				page: page,
				size: size,
				inOutNo:inOutNo
			}
		})
	},
	selectMsgAxios( batchNo) {
		return request({
			url: '/auth/GoodsHandle/getHandleByBatchNo',
			method: 'get',
			params: {
				batchNo: batchNo
			}
		})
	},
}
