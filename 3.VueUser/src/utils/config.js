const config = {
    get() {
        return {
            url : process.env.VUE_APP_BASE_API_URL + process.env.VUE_APP_BASE_API + '/',
            name: process.env.VUE_APP_BASE_API,
			menuList:[
				{
					name: '新闻资讯管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'旅游攻略',
							url:'/index/newsList'
						},
					]
				},
				{
					name: '特产中心管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'特产中心',
							url:'/index/techanzhongxinList'
						},
					]
				},
				{
					name: '景点信息管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'景点信息',
							url:'/index/jingdianxinxiList'
						},
					]
				},
				{
					name: '旅游路线管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'旅游路线',
							url:'/index/lvyouluxianList'
						},
					]
				},
			]
        }
    },
    getProjectName(){
        return {
            projectName: "飞鸽旅游服务管理系统"
        } 
    }
}
export default config
