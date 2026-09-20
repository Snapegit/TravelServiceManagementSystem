<template>
	<div class="app-contain" :style='{"padding":"0 18%","margin":"0px auto","alignItems":"flex-start","flexWrap":"wrap","display":"flex","width":"100%","position":"relative","justifyContent":"space-between"}'>
		<div class="bread_view">
			<el-breadcrumb separator="/" class="breadcrumb">
				<el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">首页</el-breadcrumb-item>
				<el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
			</el-breadcrumb>
		</div>
		<div class="back_view">
			<el-button class="back_btn" @click="backClick" type="primary">返回</el-button>
		</div>
		<div class="detail_view">
			<div class="swiper_view">
				<mySwiper :data="bannerList" :type="3"
				:loop="false"
				:navigation="false"
				:pagination="false"
				:paginationType="1"
				:scrollbar="false"
				:slidesPerView="1"
				:spaceBetween="20"
				:autoHeight="false"
				:centeredSlides="false"
				:freeMode="false"
				:effectType="0"
				:direction="horizontal"
				:autoplay="true"
				:slidesPerColumn="1">
				<template #default="scope">
					<img :style='{"objectFit":"contain","width":"100%","height":"480px"}' :src="scope.row?$config.url + scope.row:''">
				</template>
			</mySwiper>
			</div>
			
			<div class="info_view">
				<div class="title_view">
					<div class="detail_title">
						{{detail.jingdianmingcheng}}
					</div>
					<div class="follow" v-if="!collectType" @click="collectClick(1)">
						<i class="iconfont icon-likeline2"></i>
						<span>收藏</span>
					</div>
					<div class="follow" v-if="collectType" @click="collectClick(-1)">
						<i class="iconfont iconfontActive icon-likefill2"></i>
						<span class="textActive">取消收藏</span>
					</div>
				</div>
				<div class="info_item">
					<div class="info_label">景点分类</div>
					<div  class="info_text" >{{detail.jingdianfenlei}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">门票价格</div>
					<div  class="info_text" >{{detail.menpiaojiage}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">开放时间</div>
					<div  class="info_text" >{{detail.kaifangshijian}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">购票须知</div>
					<div  class="info_text" >{{detail.goupiaoxuzhi}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">景点地址</div>
					<div  class="info_text" >{{detail.jingdiandizhi}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">收藏数量</div>
					<div  class="info_text" >{{detail.storeupnum}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">点击次数</div>
					<div  class="info_text" >{{detail.clicknum}}</div>
				</div>
				<div class="btn_view">
					<el-button class="cross_btn" v-if="btnFrontAuth(tableName,'门票购买')" @click="menpiaogoumaionAcross('门票购买','menpiaogoumai','','','')" type="warning">门票购买</el-button>
					<el-button v-if="centerType&&(detail.ispay=='未支付'||!detail.ispay)&&btnFrontAuth('jingdianxinxi','支付')" class="approval_btn" @click="payClick">支付</el-button>
					<el-button class="edit_btn" v-if="centerType&&btnAuth('jingdianxinxi','修改')" type="primary" @click="editClick">修改</el-button>
					<el-button class="del_btn" v-if="centerType&&btnAuth('jingdianxinxi','删除')" type="danger" @click="delClick">删除</el-button>
				</div>
			</div>
		</div>
		<el-tabs type="border-card" v-model="activeName" class="tabs_view">
			<el-tab-pane label="景点介绍" name="first">
				<div v-html="detail.jingdianjieshao"></div>
			</el-tab-pane>
			<el-tab-pane label="评论" name="commentActive">
				<div class="my_comment_view">
					<el-form ref="commentFormRef" :model="commentForm" class="my_comment_form"
						:rules="commentRules">
						<el-form-item prop="content">
							<el-input class="comment_inp" v-model="commentForm.content" type="textarea"
								placeholder="请输入评论内容"></el-input>
						</el-form-item>
					</el-form>
					<div class="comment_btn">
						<el-button class="add_btn" type="primary" @click="commentSave">立即评论</el-button>
						<el-button class="reset_btn" @click="resetForm">重置</el-button>
					</div>
				</div>
				<div class="comment_list">
					<div class="comment" v-for="(item,index) in commentList" :key="index">
						<div class="comment_top">
							<div class="comment_user">
								<div class="comment_user_img">
									<img :src="item.avatarurl?$config.url + item.avatarurl:'../../../assets/avatar.png'" alt="">
								</div>
								<div class="comment_user_info">
									{{item.nickname}}
								</div>
							</div>
							<div class="comment_time">{{item.addtime}}</div>
						</div>
						<div class="comment_bottom">
							<div class="comment_content">{{item.content}}</div>
							<div class="comment_reply" v-if="item.reply">
								回复：{{item.reply}}
							</div>
						</div>
					</div>
				</div>
				<el-pagination
					background 
					:layout="layouts.join(',')"
					:total="commentTotal" 
					:page-size="commentQuery.limit"
					prev-text="<"
					next-text=">"
					:hide-on-single-page="false"
					:style='{"border":"0px solid #eee","padding":"4px 0","margin":"10px 0 20px","whiteSpace":"nowrap","color":"#333","textAlign":"center","flexWrap":"wrap","background":"none","display":"flex","width":"100%","fontWeight":"500","justifyContent":"center"}'
					@size-change="commentSizeChange"
					@current-change="commentCurrentChange" 
					@prev-click="commentPrevClick"
					@next-click="commentNextClick"  />
			</el-tab-pane>
		</el-tabs>
	</div>
</template>
<script setup>
	import axios from 'axios'
	import {
		ref,
		getCurrentInstance,
		watch,
		onUnmounted,
		onMounted,
		nextTick,
		computed
	} from 'vue';
	import {
		ElMessageBox
	} from 'element-plus'
	import {
		useRoute,
		useRouter
	} from 'vue-router';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const route = useRoute()
	const router = useRouter()
	//基础信息
	const tableName = 'jingdianxinxi'
	const formName = '景点信息'
	//基础信息
	const breadList = ref([{
		name: formName
	}])
	//权限验证
	const btnAuth = (e,a)=>{
		if(centerType.value){
			return context?.$toolUtil.isBackAuth(e,a)
		}else{
			return context?.$toolUtil.isAuth(e,a)
		}
	}
	//查看权限验证
	const btnFrontAuth = (e,a)=>{
		if(centerType.value){
			return context?.$toolUtil.isBackAuth(e,a)
		}else{
			return context?.$toolUtil.isFrontAuth(e,a)
		}
	}
	// 返回
	const backClick = () =>{
		history.back()
	}
	// 轮播图
	const bannerList = ref([])
	// 详情
	const title = ref('')
	const detail = ref({})
    const activeName = ref('first')
	const getDetail = () => {
		context?.$http({
			url: `${tableName}/detail/${route.query.id}`,
			method: 'get'
		}).then(res => {
			title.value = res.data.data.jingdianmingcheng
			bannerList.value = res.data.data.jingdiantupian?res.data.data.jingdiantupian.split(','):[]
			detail.value = res.data.data
		})
	}
	// 下载文件
	const downClick = (file) => {
		if(!file){
			context?.$toolUtil.message('文件不存在','error')
		}
		let arr = file.replace(new RegExp('file/', "g"), "")
		axios.get((location.href.split(context?.$config.name).length>1 ? location.href.split(context?.$config.name)[0] :'') + context?.$config.name + '/file/download?fileName=' + arr, {
			headers: {
				token: context?.$toolUtil.storageGet('frontToken')
			},
			responseType: "blob"
		}).then(({
			data
		}) => {
			const binaryData = [];
			binaryData.push(data);
			const objectUrl = window.URL.createObjectURL(new Blob(binaryData, {
				type: 'application/pdf;chartset=UTF-8'
			}))
			const a = document.createElement('a')
			a.href = objectUrl
			a.download = arr
			// a.click()
			// 下面这个写法兼容火狐
			a.dispatchEvent(new MouseEvent('click', {
				bubbles: true,
				cancelable: true,
				view: window
			}))
			window.URL.revokeObjectURL(data)
		})
	}
	// 判断是否从个人中心跳转
	const centerType = ref(false)
	const init = () => {
		if(route.query.centerType){
			centerType.value = true
		}
		getDetail()
		// 收藏
		getCollect()
		// 评论
		getCommentList()
	}
	// 收藏
	const collectType = ref(false)
	const collectInfo = ref({})
	const getCollect = () => {
		if (context?.$toolUtil.storageGet('frontToken')) {
			context?.$http({
				url: 'storeup/list',
				method: 'get',
				params: {
					page: 1,
					limit: 1,
					type: 1,
					refid: route.query.id,
					tablename: tableName,
					userid: context?.$toolUtil.storageGet('userid')
				}
			}).then(res => {
				if (res.data.data.list.length) {
					collectType.value = true
					collectInfo.value = res.data.data.list[0]
				}else{
					collectType.value = false
					collectInfo.value = {}
				}
			})
		}
	}
	// 收藏按钮
	const collectClick = (type) => {
		if (type == 1 && !collectType.value) {
			let params = {
				name: title.value,
				picture: bannerList.value[0],
				refid: detail.value.id,
				type: type,
				tablename: tableName,
				userid: context?.$toolUtil.storageGet('userid')
			}
			context?.$http({
				url: 'storeup/add',
				method: 'post',
				data: params
			}).then(res => {
				detail.value.storeupnum += 1
				context?.$http({
					url: `${tableName}/update`,
					method: 'post',
					data: detail.value
				})
				collectType.value = true
				getCollect()
				context?.$toolUtil.message('收藏成功', 'success')
			})
		}
		else if (type == -1 && collectType.value) {
			let ids = []
			ids.push(collectInfo.value.id)
			context?.$http({
				url: 'storeup/delete',
				method: 'post',
				data: ids
			}).then(res => {
				detail.value.storeupnum -= 1
				context?.$http({
					url: `${tableName}/update`,
					method: 'post',
					data: detail.value
				})
				collectInfo.value = {}
				collectType.value = false
				context?.$toolUtil.message('取消成功', 'success')
			})
		}
	}
	//评论
	const commentForm = ref({
		content: '',
		refid: route.query.id,
		userid: context?.$toolUtil.storageGet('userid'),
		nickname: context?.$toolUtil.storageGet('frontName'),
		avatarurl: context?.$toolUtil.storageGet('headportrait') ? context?.$toolUtil.storageGet('headportrait') : ''
	})
	const commentRules = ref({
		content: [{
			required: true,
			message: '请输入',
			trigger: 'blur'
		}, ]
	})
	const commentQuery = ref({
		page: 1,
		limit: 10,
		refid: route.query.id
	})
	const layouts = ref(["prev","pager","next"])
	const commentList = ref([])
	const commentTotal = ref(0)
	const commentFormRef = ref(null)
	const commentSizeChange = (size) =>{
		commentQuery.value.limit = size
		getCommentList()
	}
	const commentCurrentChange = (page) =>{
		commentQuery.value.page = page
		getCommentList()
	}
	const commentPrevClick = () =>{
		commentQuery.value.page = commentQuery.value.page - 1
		getCommentList()
	}
	const commentNextClick = () =>{
		commentQuery.value.page = commentQuery.value.page + 1
		getCommentList()
	}
	const getCommentList = () => {
		context?.$http({
			url: `discuss${tableName}/list`,
			params: commentQuery.value,
			method: 'get'
		}).then(res => {
			commentList.value = res.data.data.list
			commentTotal.value = res.data.data.total
	
		})
	}
	//提交评论
	const commentSave = () => {
		let sensitiveWords = "";
		let sensitiveWordsArr = [];
		if(sensitiveWords) {
		    sensitiveWordsArr = sensitiveWords.split(",");
		}
		for(var i=0; i<sensitiveWordsArr.length; i++){
		    //全局替换
		    var reg = new RegExp(sensitiveWordsArr[i],"g");
		    //判断内容中是否包括敏感词
		    if (commentForm.value.content.indexOf(sensitiveWordsArr[i]) > -1) {
		        // 将敏感词替换为 **
		        commentForm.value.content = commentForm.value.content.replace(reg,"**");
		    }
		}
		commentFormRef.value.validate((valid) => {
			if (valid) {
				context?.$http({
					url: `discuss${tableName}/add`,
					method: 'post',
					data: commentForm.value
				}).then(res => {
					context?.$toolUtil.message('评论成功', 'success', () => {
						resetForm()
						getCommentList()
					})
				})
			}
		})
	}
	const resetForm = () => {
		commentFormRef.value.resetFields()
	}
	//修改
	const editClick = () => {
		router.push(`/index/${tableName}Add?id=${detail.value.id}&&type=edit`)
	}
	//删除
	const delClick = () => {
		ElMessageBox.confirm(`是否删除此${formName}？`, '提示', {
			confirmButtonText: '是',
			cancelButtonText: '否',
			type: 'warning',
		}).then(()=>{
			context?.$http({
				url: `${tableName}/delete`,
				method: 'post',
				data: [detail.value.id]
			}).then(res=>{
				context?.$toolUtil.message('删除成功','success',()=>{
					history.back()
				})
			})
			
		})
	}
	const menpiaogoumaionAcross = (btnType,table,crossOptAudit,statusColumnName,tips,statusColumnValue) => {
		if(!context?.$toolUtil.storageGet('frontToken')){
			context?.$toolUtil.message('请登录后再操作！','error')
			return false
		}
		if(!btnAuth(tableName,btnType)){
			context?.$toolUtil.message('暂无权限操作！','error')
			return false
		}
		context?.$toolUtil.storageSet('crossObj',JSON.stringify(detail.value))
		context?.$toolUtil.storageSet('crossTable',tableName)
		context?.$toolUtil.storageSet('crossStatusColumnName',statusColumnName)
		context?.$toolUtil.storageSet('crossTips',tips)
		context?.$toolUtil.storageSet('crossStatusColumnValue',statusColumnValue)
		if(statusColumnName!=''&&!statusColumnName.startsWith("[")) {
			var obj = detail.value
			for (var o in obj){
				if(o==statusColumnName && obj[o]==statusColumnValue){
					context?.$toolUtil.message(tips,'error')
					return;
				}
			}
		}
		nextTick(()=>{
			router.push(`/index/${table}Add?type=cross&&id=${detail.value.id}`)
		})
	}
	onMounted(()=>{
		init()
	})
</script>
<style lang="scss" scoped>
	// 返回盒子
	.back_view {
		border-radius: 0px;
		padding: 0;
		margin: 10px auto;
		background: none;
		display: block;
		width: 100%;
		text-align: right;
		// 返回按钮
		.back_btn {
			border: 1px solid #eee;
			cursor: pointer;
			border-radius: 2px;
			padding: 0 30px;
			outline: none;
			color: #666;
			background: #f9f9f9;
			width: auto;
			font-size: 14px;
			height: 32px;
		}
		// 返回按钮-悬浮
		.back_btn:hover {
		}
	}
	// 面包屑盒子
	.bread_view {
		border: 1px solid #ddd;
		border-radius: 0px;
		padding: 12px 20px;
		margin: 10px auto 10px;
		background: #f9f9f9;
		width: 100%;
		position: relative;
		:deep(.breadcrumb) {
			font-size: 14px;
			line-height: 1;
			.el-breadcrumb__separator {
				margin: 0 9px;
				color: #ccc;
				font-weight: 500;
			}
			.first_breadcrumb {
				.el-breadcrumb__inner {
					color: #333;
					display: inline-block;
				}
			}
			.second_breadcrumb {
				.el-breadcrumb__inner {
					color: #999;
					display: inline-block;
				}
			}
		}
	}
	
	.detail_view{
		border: 1px solid #ddd;
		border-radius: 0px;
		padding: 40px 20px 20px;
		background: #f9f9f9;
		display: flex;
		width: 100%;
		justify-content: space-between;
		position: relative;
		flex-wrap: wrap;
		// 轮播图
		.swiper_view {
			border: 1px solid #eee;
			padding: 0;
			margin: 0px auto;
			background: #fff;
			width: 480px;
			height: 480px;
		}
		
		// 文字区
		.info_view {
			border: 0px solid #eee;
			padding: 0px 20px;
			margin: 0 0 20px;
			background: none;
			width: calc(100% - 500px);
			box-sizing: border-box;
		
			.title_view {
				border: 0px solid #eee;
				padding: 0 20px;
				margin: 0 0 12px;
				background: #cc0000;
				display: flex;
				width: 100%;
				line-height: 40px;
				justify-content: space-between;
				align-items: center;
		
				.detail_title {
					color: #fff;
					font-weight: 500;
					font-size: 16px;
				}
				// 收藏盒子
				.follow {
					border: 0px solid #ffffff50;
					cursor: pointer;
					border-radius: 4px;
					padding: 4px 10px;
					color: #fff;
					background: none;
					display: flex;
					width: auto;
					line-height: 1;
					justify-content: center;
					align-items: center;
					.iconfont {
						margin: 0 4px 0 0;
						color: #fff;
					}
					.iconfontActive {
						margin: 0 4px 0 0;
						color: #f79d1c;
					}
					span {
						color: #fff;
					}
					.textActive {
						color: #f79d1c;
					}
				}
				.follow:hover {
				}
				.follow:active {
					transform: scale(0.9);
				}
			}
		
			.info_item {
					border-radius: 0px;
					padding: 0;
					margin: 0 0 10px;
					background: none;
					display: flex;
					border-color: #eee;
					border-width: 0px;
					align-items: center;
					border-style: solid;
		
				.info_label {
					margin: 0 12px 0 0;
					color: #666;
					font-weight: 500;
					width: auto;
				}
				.info_text {
				}
			}
			.btn_view {
				padding: 0;
				margin: 20px 0 20px;
				display: flex;
				flex-wrap: wrap;
				// 跨表-按钮
				.cross_btn {
					border: none;
					padding: 0 10px;
					color: #fff;
					background: rgba(170, 0, 0, 1.0);
					line-height: 32px;
					height: 32px;
				}
				// 悬浮
				.cross_btn:hover {
					border: none;
					color: #333;
					background: rgba(170, 0, 0, 0.5);
				}
				// 修改-按钮
				.edit_btn {
					border: none;
					padding: 0 10px;
					color: #fff;
					background: rgba(255, 85, 0, 1.0);
					line-height: 32px;
					height: 32px;
				}
				// 悬浮
				.edit_btn:hover {
					border: none;
					color: #333;
					background: rgba(255, 85, 0, 0.5);
				}
				// 删除-按钮
				.del_btn {
					border: none;
					padding: 0 10px;
					color: #fff;
					background: #e96578;
					line-height: 32px;
					height: 32px;
				}
				// 悬浮
				.del_btn:hover {
					border: none;
					color: #333;
					background: rgba(233, 101, 120, 0.5);
				}
			}
		}
	}
	

	//底部盒子
	.tabs_view {
		border: 1px solid #ddd;
		border-radius: 0px;
		padding: 10px;
		box-shadow: none;
		margin: 20px auto;
		background: none;
		width: 100%;
		:deep(.el-tabs__header) {
			background: transparent;
			border: none;
		}
		// 头部
		:deep(.el-tabs__nav-scroll) {
			border-radius: 0;
			padding: 2px 20px 0;
			margin: 0;
			background: #f9f9f9;
			border-color: #ddd;
			border-width: 0 0 0px;
			border-style: solid;
			height: 36px;
			.el-tabs__nav {
				.el-tabs__item {
					border: 0;
					padding: 0 20px;
					margin: 0 10px;
					color: #333;
					font-weight: 500;
					display: inline-block;
					font-size: 14px;
					line-height: 36px;
					background: none;
					position: relative;
					list-style: none;
					text-align: center;
					min-width: 60px;
					height: 36px;
				}
				.el-tabs__item:hover {
					border: 0;
					border-radius: 0;
					color: #fff;
					background: #c00;
				}
				.is-active {
					border: 0;
					border-radius: 0;
					color: #fff;
					background: #c00;
					min-width: 60px;
					text-align: center;
				}
			}
		}
		// 内容区
		:deep(.el-tabs__content) {
			border-radius: 0 0 4px 4px;
			padding: 20px;
			color: #666;
			background: none;
			font-size: 14px;
			border-color: #eee;
			border-width: 0;
			border-style: solid;
		}
		//评论
		//我的评论
		.my_comment_view {
			border: 0px solid #eee;
			border-radius: 4px;
			box-shadow: none;
			padding: 20px;
			margin: 0px;
			background: none;
			width: 100%;
		
			.my_comment_form {
				border: 0px solid #eee;
				border-radius: 0px;
				padding: 0px;
				box-shadow: none;
				background: #fff;
				width: 100%;
				box-sizing: border-box;
				// 输入框
				:deep(.el-textarea__inner) {
					border: 1px solid #eee;
					border-radius: 0;
					padding: 12px;
					box-shadow: none;
					color: #333;
					width: 100%;
					font-size: 14px;
					min-height: 120px;
				}
			}
			// 按钮盒子
			.comment_btn {
				margin: 20px 0 0;
				display: flex;
				width: 100%;
				justify-content: flex-end;
				align-items: center;
				// 评论按钮
				.add_btn {
					border: none;
					margin: 0 20px 0 0;
					color: #fff;
					background: #c00;
				}
				// 悬浮
				.add_btn:hover {
				}
				// 重置按钮
				.reset_btn {
					border: none;
					color: #fff;
					background: #999;
					min-width: 100px;
				}
				// 悬浮
				.reset_btn:hover {
				}
			}
		}
		
		//评论列表
		.comment_list {
			border: 0px solid #eee;
			border-radius: 4px;
			padding: 0px;
			margin: 20px auto;
			background: none;
			width: 100%;
		
			.comment {
				border: 0px solid #eee;
				border-radius: 4px;
				padding: 0px;
				margin: 0 0 20px;
				background: none;
				width: 100%;
				box-sizing: border-box;
				.comment_top {
					border-radius: 0px;
					padding: 0 0 6px;
					background: #f8f8f8;
					display: flex;
					width: 100%;
					font-size: 14px;
					border-color: #eee;
					border-width: 0 0 1px;
					align-items: center;
					border-style: solid;
		
					.comment_user {
						border-radius: 4px;
						padding: 4px 30px 4px 10px;
						display: block;
						align-items: center;
						.comment_user_img {
							margin: 0 10px 0 0;
							font-size: 0;
							float: left;
		
							img {
								border-radius: 50%;
								width: 40px;
								height: 40px;
							}
						}
						.comment_user_info {
							color: #333;
							font-weight: 600;
							font-size: 14px;
							line-height: 40px;
							float: left;
						}
					}
					.comment_time{
						border: 0px solid #eee;
						border-radius: 4px;
						padding: 0px 8px;
						color: #999;
						font-size: 14px;
						float: right;
					}
				}
		
				.comment_bottom {
					border: 0px solid #eee;
					border-radius: 4px;
					padding: 0px 10px;
					margin: 10px 0 0;
					flex-direction: column;
					display: flex;
					width: 100%;
					align-items: flex-start;
					.comment_content {
						color: #666;
						font-weight: 600;
						font-size: 14px;
					}
					.comment_reply {
						padding: 10px 0 0;
						flex-direction: column;
						color: #999;
						text-indent: 2rem;
						display: flex;
						width: 100%;
						font-size: 14px;
						align-items: flex-start;
					}
				}
			}
		}
		// 分页器
		.el-pagination {
			// 总页码
			:deep(.el-pagination__total) {
				margin: 0 10px 0 0;
				color: #666;
				font-weight: 400;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 24px;
				height: 24px;
			}
			// 上一页
			:deep(.btn-prev) {
				border: none;
				border-radius: 2px;
				padding: 0;
				margin: 0 2px;
				color: #666;
				background: #f4f4f5;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 24px;
				min-width: 24px;
				height: 24px;
			}
			// 下一页
			:deep(.btn-next) {
				border: none;
				border-radius: 2px;
				padding: 0;
				margin: 0 2px;
				color: #666;
				background: #f4f4f5;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 24px;
				min-width: 24px;
				height: 24px;
			}
			// 上一页禁用
			:deep(.btn-prev:disabled) {
				border: none;
				cursor: not-allowed;
				padding: 0;
				margin: 0 2px;
				color: #C0C4CC;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 24px;
				border-radius: 2px;
				background: #f4f4f5;
				width: 24px;
				height: 24px;
			}
			// 下一页禁用
			:deep(.btn-next:disabled) {
				border: none;
				cursor: not-allowed;
				padding: 0;
				margin: 0 2px;
				color: #C0C4CC;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 24px;
				border-radius: 2px;
				background: #f4f4f5;
				width: 24px;
				height: 24px;
			}
			// 页码
			:deep(.el-pager) {
				padding: 0;
				margin: 0;
				display: inline-block;
				vertical-align: top;
				// 数字
				.number {
					cursor: pointer;
					padding: 0 4px;
					margin: 0 5px;
					color: #666;
					display: inline-block;
					vertical-align: top;
					font-size: 13px;
					line-height: 24px;
					border-radius: 2px;
					background: #f4f4f5;
					text-align: center;
					min-width: 24px;
					height: 24px;
				}
				// 数字悬浮
				.number:hover {
					cursor: pointer;
					padding: 0 4px;
					margin: 0 5px;
					color: #fff;
					display: inline-block;
					vertical-align: top;
					font-size: 13px;
					line-height: 24px;
					border-radius: 2px;
					background: #c00;
					text-align: center;
					min-width: 24px;
					height: 24px;
				}
				// 选中
				.number.is-active {
					cursor: default;
					padding: 0 4px;
					margin: 0 5px;
					color: #fff;
					display: inline-block;
					vertical-align: top;
					font-size: 13px;
					line-height: 24px;
					border-radius: 2px;
					background: #c00;
					text-align: center;
					min-width: 24px;
					height: 24px;
				}
			}
			// sizes
			:deep(.el-pagination__sizes) {
				box-shadow: none;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 24px;
				height: 24px;
				.el-select {
					border: 1px solid #DCDFE6;
					cursor: pointer;
					padding: 0;
					color: #606266;
					display: inline-block;
					font-size: 13px;
					line-height: 24px;
					border-radius: 0px;
					outline: 0;
					background: #fff;
					width: 100%;
					text-align: center;
					height: 24px;
				//去掉默认样式
				.select-trigger{
					height: 100%;
					.el-input{
						height: 100%;
						.el-input__wrapper{
							border: none;
							box-shadow: none;
							background: none;
							border-radius: 0;
							height: 100%;
							padding: 0;
						}
						.is-focus {
							box-shadow: none !important;
						}
					}
				}
				}
			}
			// 跳页
			:deep(.el-pagination__jump) {
				margin: 0 0 0 24px;
				color: #606266;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				height: 28px;
				// 输入框
				.el-input {
					border: 1px solid #DCDFE6;
					cursor: pointer;
					padding: 0 3px;
					margin: 0 6px;
					color: #606266;
					display: inline-block;
					font-size: 14px;
					line-height: 24px;
					border-radius: 3px;
					outline: 0;
					background: #FFF;
					width: 38px;
					text-align: center;
					height: 24px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
						padding: 0;
					}
					.is-focus {
						box-shadow: none !important;
					}
				}
			}
		}
	}
	


</style>