import request from '@/utils/request'

export default {
	// String goodId, String goodName,Integer page,Integer size
	selectAxios(goodId, goodName, page, size) {
		return request({
			url: '/auth/GoodsInfo/select',
			method: 'get',
			params: {
				goodId: goodId,
				goodName: goodName,
				page: page,
				size: size
			}
		})
	},
	// Integer goodsId, Integer num, String desc
	updateAxios(goodId, num, desc) {
		return request({
			url: '/auth/GoodsInfo/update',
			method: 'get',
			params: {
				goodsId: goodId,
				num: num,
				desc: desc
			}
		})
	}
}
