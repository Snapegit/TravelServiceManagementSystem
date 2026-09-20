import { createRouter, createWebHashHistory } from 'vue-router'
import index from '../views'
import home from '../views/pages/home.vue'
import login from '../views/pages/login.vue'
import newsList from '@/views/pages/news/list'
import yonghuList from '@/views/pages/yonghu/list'
import yonghuDetail from '@/views/pages/yonghu/formModel'
import yonghuAdd from '@/views/pages/yonghu/formAdd'
import yonghuRegister from '@/views/pages/yonghu/register'
import yonghuCenter from '@/views/pages/yonghu/center'
import jingdianxinxiList from '@/views/pages/jingdianxinxi/list'
import jingdianxinxiDetail from '@/views/pages/jingdianxinxi/formModel'
import jingdianxinxiAdd from '@/views/pages/jingdianxinxi/formAdd'
import storeupList from '@/views/pages/storeup/list'
import menpiaogoumaiList from '@/views/pages/menpiaogoumai/list'
import menpiaogoumaiDetail from '@/views/pages/menpiaogoumai/formModel'
import menpiaogoumaiAdd from '@/views/pages/menpiaogoumai/formAdd'
import techanzhongxinList from '@/views/pages/techanzhongxin/list'
import techanzhongxinDetail from '@/views/pages/techanzhongxin/formModel'
import techanzhongxinAdd from '@/views/pages/techanzhongxin/formAdd'
import jingdianfenleiList from '@/views/pages/jingdianfenlei/list'
import jingdianfenleiDetail from '@/views/pages/jingdianfenlei/formModel'
import jingdianfenleiAdd from '@/views/pages/jingdianfenlei/formAdd'
import lvyouluxianList from '@/views/pages/lvyouluxian/list'
import lvyouluxianDetail from '@/views/pages/lvyouluxian/formModel'
import lvyouluxianAdd from '@/views/pages/lvyouluxian/formAdd'

const routes = [{
		path: '/',
		redirect: '/index/home'
	},
	{
		path: '/index',
		component: index,
		children: [{
			path: 'home',
			component: home
		}
		, {
			path: 'newsList',
			component: newsList
		}
		, {
			path: 'yonghuList',
			component: yonghuList
		}, {
			path: 'yonghuDetail',
			component: yonghuDetail
		}, {
			path: 'yonghuAdd',
			component: yonghuAdd
		}
		, {
			path: 'yonghuCenter',
			component: yonghuCenter
		}
		, {
			path: 'jingdianxinxiList',
			component: jingdianxinxiList
		}, {
			path: 'jingdianxinxiDetail',
			component: jingdianxinxiDetail
		}, {
			path: 'jingdianxinxiAdd',
			component: jingdianxinxiAdd
		}
		, {
			path: 'storeupList',
			component: storeupList
		}
		, {
			path: 'menpiaogoumaiList',
			component: menpiaogoumaiList
		}, {
			path: 'menpiaogoumaiDetail',
			component: menpiaogoumaiDetail
		}, {
			path: 'menpiaogoumaiAdd',
			component: menpiaogoumaiAdd
		}
		, {
			path: 'techanzhongxinList',
			component: techanzhongxinList
		}, {
			path: 'techanzhongxinDetail',
			component: techanzhongxinDetail
		}, {
			path: 'techanzhongxinAdd',
			component: techanzhongxinAdd
		}
		, {
			path: 'jingdianfenleiList',
			component: jingdianfenleiList
		}, {
			path: 'jingdianfenleiDetail',
			component: jingdianfenleiDetail
		}, {
			path: 'jingdianfenleiAdd',
			component: jingdianfenleiAdd
		}
		, {
			path: 'lvyouluxianList',
			component: lvyouluxianList
		}, {
			path: 'lvyouluxianDetail',
			component: lvyouluxianDetail
		}, {
			path: 'lvyouluxianAdd',
			component: lvyouluxianAdd
		}
		]
	},
	{
		path: '/login',
		component: login
	}
	,{
		path: '/yonghuRegister',
		component: yonghuRegister
	}
]

const router = createRouter({
  history: createWebHashHistory(process.env.BASE_URL),
  routes
})

export default router
