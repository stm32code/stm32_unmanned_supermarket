import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/layout'


/**
 * Note: sub-menu only appear when route children.length >= 1
 * Detail see: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
 *
 * hidden: true                   if set true, item will not show in the sidebar(default is false)
 * alwaysShow: true               if set true, will always show the root menu
 *                                if not set alwaysShow, when item has more than one children route,
 *                                it will becomes nested mode, otherwise not show the root menu
 * redirect: noRedirect           if set noRedirect will no redirect in the breadcrumb
 * name:'router-name'             the name is used by <keep-alive> (must set!!!)
 * meta : {
    roles: ['admin','editor']    control the page roles (you can set multiple roles)
    title: 'title'               the name show in sidebar and breadcrumb (recommend set)
    icon: 'svg-name'/'el-icon-x' the icon show in the sidebar
    breadcrumb: false            if set false, the item will hidden in breadcrumb(default is true)
    activeMenu: '/example/list'  if set path, the sidebar will highlight the path you set
  }
 */

/**
 * constantRoutes
 * a base page that does not have permission requirements
 * all roles can be accessed
 */
export const constantRoutes = [
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true
  },

  {
    path: '/404',
    component: () => import('@/views/404'),
    hidden: true
  },

  {
    path: '/',
    component: Layout,
    redirect: '/index',
    children: [      {
        path: 'index',
        name: 'index',
        component: () => import('@/views/index/index'),
        meta: { title: '首页', icon: 'tree' }
      }]
  },

  {
    path: '/my',
    component: Layout,
    redirect: '/my/admin_user',
    name: '',
    meta: { title: '管理系统', icon: 'el-icon-user-solid' ,roles: ['pan'] },
    children: [
      {
        path: 'admin_user',
        name: 'admin_user',
        component: () => import('@/views/my/admin_user'),
        meta: { title: '用户管理', icon: 'table'}
      },{
        path: 'admin_goods',
        name: 'admin_goods',
        component: () => import('@/views/my/admin_goods'),
        meta: { title: '商品管理', icon: 'table'}
      },{
        path: 'admin_history',
        name: 'admin_history',
        component: () => import('@/views/my/admin_history'),
        meta: { title: '购买记录查询', icon: 'table'}
      },{
        path: 'admin_goods_chart',
        name: 'admin_goods_chart',
        component: () => import('@/views/my/admin_goods_chart'),
        meta: { title: '商品占比统计', icon: 'table'}
      },
      {
        path: 'admin_goods_history',
        name: 'admin_goods_history',
        component: () => import('@/views/my/admin_goods_history'),
        meta: { title: '销售额趋势统计', icon: 'table'}
      },
    ]
  },
  // 404 page must be placed at the end !!!
  { path: '*', redirect: '/404', hidden: true }
]

export const asyncRoutes = [
  // {
  //   path: '/ck',
  //   component: Layout,
  //   redirect: '/ck/company_style',
  //   name: '',
  //   meta: { title: '管理系统', icon: 'el-icon-user-solid' ,roles: ['pan'] },
  //   children: [
  //     {
  //       path: 'company_style',
  //       name: 'company_style',
  //       component: () => import('@/views/CompanyStyle/index'),
  //       meta: { title: '参数管理', icon: 'table', roles: ['pan'] }
  //     }
		// 	// ,
  //  //    {
  //  //      path: 'userBorrow',
  //  //      name: 'UserBorrow',
  //  //      component: () => import('@/views/book/user_borrow'),
  //  //      meta: { title: '借/还书', icon: 'table' , roles: ['pan']}
  //  //    },
		// 	// {
		// 	//   path: 'userBorrowList',
		// 	//   name: 'UserBorrowList',
		// 	//   component: () => import('@/views/book/user_borrow_list'),
		// 	//   meta: { title: '借阅列表', icon: 'table' , roles: ['pan']}
		// 	// },
		// 	// {
		// 	//   path: 'bookInfo/:id',
		// 	//   name: 'BookInfo',
		// 	// 	hidden: true,
		// 	//   component: () => import('@/views/book/book_info'),
		// 	//   meta: { title: '书籍详细信息', icon: 'table' , roles: ['pan']}
		// 	// },
		// 	// {
		// 	//   path: 'userChart',
		// 	//   name: 'UserChart',
		// 	//   component: () => import('@/views/book/user_echart'),
		// 	//   meta: { title: '图表统计', icon: 'table' , roles: ['pan']}
		// 	// }
  //   ]
  // },


  // 404 page must be placed at the end !!!
  { path: '*', redirect: '/404', hidden: true }
]



const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router
