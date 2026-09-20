	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import news from '@/views/news/list'
	import discusslvyouluxian from '@/views/discusslvyouluxian/list'
	import lvyouluxian from '@/views/lvyouluxian/list'
	import jingdianfenlei from '@/views/jingdianfenlei/list'
	import yonghu from '@/views/yonghu/list'
	import menpiaogoumai from '@/views/menpiaogoumai/list'
	import discussjingdianxinxi from '@/views/discussjingdianxinxi/list'
	import jingdianxinxi from '@/views/jingdianxinxi/list'
	import storeup from '@/views/storeup/list'
	import config from '@/views/config/list'
	import users from '@/views/users/list'
	import techanzhongxin from '@/views/techanzhongxin/list'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页Home',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/news',
			name: '旅游攻略',
			component: news
		}
		,{
			path: '/discusslvyouluxian',
			name: '旅游路线评论',
			component: discusslvyouluxian
		}
		,{
			path: '/lvyouluxian',
			name: '旅游路线',
			component: lvyouluxian
		}
		,{
			path: '/jingdianfenlei',
			name: '景点分类',
			component: jingdianfenlei
		}
		,{
			path: '/yonghu',
			name: '用户',
			component: yonghu
		}
		,{
			path: '/menpiaogoumai',
			name: '门票购买',
			component: menpiaogoumai
		}
		,{
			path: '/discussjingdianxinxi',
			name: '景点信息评论',
			component: discussjingdianxinxi
		}
		,{
			path: '/jingdianxinxi',
			name: '景点信息',
			component: jingdianxinxi
		}
		,{
			path: '/storeup',
			name: '我的收藏',
			component: storeup
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		,{
			path: '/users',
			name: '管理员',
			component: users
		}
		,{
			path: '/techanzhongxin',
			name: '特产中心',
			component: techanzhongxin
		}
		]
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
