import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue'
import login from '../views/account/login.vue';

Vue.use(VueRouter)

const routes = [
	// 主页ss
	{
		path: '/',
		name: 'index',
		component: index
	},
	// 登录
	{
		path: '/account/login',
		name: 'login',
		component: login
	},
	// 忘记密码
	{
		path: '/account/forgot',
		name: 'forgot',
		component: () => import('../views/account/forgot.vue')
	},
	// 注册账号
	{
		path: '/account/register',
		name: 'register',
		component: () => import('../views/account/register.vue')
	},
	// 媒体图片
	{
		path: '/media/image',
		name: 'media_image',
		component: () => import('../views/media/image.vue')
	},
	// 音乐
	{
		path: '/media/music',
		name: 'media_music',
		component: () => import('../views/media/music.vue')
	},
	// 媒体视频
	{
		path: '/media/video',
		name: 'media_video',
		component: () => import('../views/media/video.vue')
	},
	// 浏览网站
	// 收藏路由
	{
		path: '/user/collect',
		name: 'collect_list',
		component: () => import('../views/user/collect.vue')
	},
	// 公告路由
	{
		path: '/notice/list',
		name: 'notice_list',
		component: () => import('../views/notice/list.vue')
	},
	{
		path: '/notice/details',
		name: 'notice_details',
		component: () => import('../views/notice/details.vue')
	},
	//来访登记添加路由
	{
		path: '/visit/edit',
		name: '/visit_edit',
		component: () => import('../views/visit/edit.vue')
	},
	//报修申请添加路由
	{
		path: '/repair_application/edit',
		name: '/repair_application_edit',
		component: () => import('../views/repair_application/edit.vue')
	},
	//投票中心列表路由
	{
		path: '/voting_center/list',
		name: '/voting_center_list',
		component: () => import('../views/voting_center/list.vue')
	},
	//投票中心详情路由
	{
		path: '/voting_center/details',
		name: '/voting_center_details',
		component: () => import('../views/voting_center/details.vue')
	},
	//投票管理添加路由
	{
		path: '/voting_management/edit',
		name: '/voting_management_edit',
		component: () => import('../views/voting_management/edit.vue')
	},
	//反馈中心添加路由
	{
		path: '/feedback_center/edit',
		name: '/feedback_center_edit',
		component: () => import('../views/feedback_center/edit.vue')
	},

	// 用户路由
	{
		path: '/user/index',
		name: 'user_index',
		component: () => import('../views/user/index.vue')
	},
	// 基本信息
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue')
	},
	// 找回密码
	{
		path: '/user/password',
		name: 'user_password',
		component: () => import('../views/user/password.vue')
	},

	// 搜索
	{
		path: '/search',
		name: 'search',
		component: () => import('../views/search/index.vue')
	},
	// 局部搜索
	{
		path: '/search/details',
		name: 'search_details',
		component: () => import('../views/search/details.vue')
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.afterEach((to, from, next) => {
	let title = "小区物业管理系统-home";
	document.title = title;
	document.logo = "小区物业管理系统"
})

export default router
