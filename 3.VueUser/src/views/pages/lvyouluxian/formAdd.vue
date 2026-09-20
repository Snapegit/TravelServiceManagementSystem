
<template>
	<div class="app-contain" :style='{"minHeight":"100vh","padding":"0 18%","margin":"20px auto 60px","background":"#fff","width":"100%","position":"relative","height":"100%"}'>
		<div class="bread_view">
			<el-breadcrumb separator="/" class="breadcrumb">
				<el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">首页</el-breadcrumb-item>
				<el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
			</el-breadcrumb>
		</div>
		<el-form ref="formRef" :model="form" class="add_form" label-width="120px" :rules="rules">
			<el-row>
				<el-col :span="12">
					<el-form-item label="路线名称" prop="luxianmingcheng">
						<el-input class="list_inp" v-model="form.luxianmingcheng" placeholder="路线名称"
							 type="text" 							:readonly="!isAdd||disabledForm.luxianmingcheng?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="景点名称" prop="jingdianmingcheng">
						<el-input class="list_inp" v-model="form.jingdianmingcheng" placeholder="景点名称"
							 type="text" 							:readonly="!isAdd||disabledForm.jingdianmingcheng?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="路线图片" prop="luxiantupian">
						<uploads
							:disabled="!isAdd||disabledForm.luxiantupian?true:false"
							action="file/upload" 
							tip="请上传路线图片" 
							:limit="3" 
							style="width: 100%;text-align: left;"
							:fileUrls="form.luxiantupian?form.luxiantupian:''" 
							@change="luxiantupianUploadSuccess">
						</uploads>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="起点" prop="qidian">
						<el-input class="list_inp" v-model="form.qidian" placeholder="起点"
							 type="text" 							:readonly="!isAdd||disabledForm.qidian?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="途径路段" prop="tujingluduan">
						<el-input class="list_inp" v-model="form.tujingluduan" placeholder="途径路段"
							 type="text" 							:readonly="!isAdd||disabledForm.tujingluduan?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="目的地" prop="mudedi">
						<el-input class="list_inp" v-model="form.mudedi" placeholder="目的地"
							 type="text" 							:readonly="!isAdd||disabledForm.mudedi?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="出行方式" prop="chuxingfangshi">
						<el-input class="list_inp" v-model="form.chuxingfangshi" placeholder="出行方式"
							 type="text" 							:readonly="!isAdd||disabledForm.chuxingfangshi?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="行程天数" prop="xingchengtianshu">
						<el-input class="list_inp" v-model="form.xingchengtianshu" placeholder="行程天数"
							 type="text" 							:readonly="!isAdd||disabledForm.xingchengtianshu?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="12">
					<el-form-item label="景点介绍" prop="jingdianjieshao">
						<el-input v-model="form.jingdianjieshao" placeholder="景点介绍" type="textarea"
						:readonly="!isAdd||disabledForm.jingdianjieshao?true:false"
						/>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="路线介绍" prop="luxianjieshao">
						<el-input v-model="form.luxianjieshao" placeholder="路线介绍" type="textarea"
						:readonly="!isAdd||disabledForm.luxianjieshao?true:false"
						/>
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item label="行程安排" prop="xingchenganpai">
						<editor class="list_editor" :value="form.xingchenganpai" placeholder="请输入行程安排" :readonly="!isAdd||disabledForm.xingchenganpai?true:false"
							@change="(e)=>editorChange(e,'xingchenganpai')"></editor>
					</el-form-item>
				</el-col>
			</el-row>
			<div class="formModel_btn_box">
				<el-button class="formModel_cancel" @click="backClick">取消</el-button>
				<el-button class="formModel_confirm" @click="save"
					type="success"
					>
					保存
				</el-button>
			</div>
		</el-form>
	</div>
</template>
<script setup>
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
		useRoute,
		useRouter
	} from 'vue-router';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const route = useRoute()
	const router = useRouter()
	//基础信息
	const tableName = 'lvyouluxian'
	const formName = '旅游路线'
	//基础信息
	const breadList = ref([{
		name: formName
	}])
	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//form表单
	const form = ref({
		luxianmingcheng: '',
		jingdianmingcheng: '',
		jingdianjieshao: '',
		luxiantupian: '',
		qidian: '',
		tujingluduan: '',
		mudedi: '',
		chuxingfangshi: '',
		luxianjieshao: '',
		xingchengtianshu: '',
		xingchenganpai: '',
		storeupnum: '0',
		clicknum: '0',
	})
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	const disabledForm = ref({
		luxianmingcheng : false,
		jingdianmingcheng : false,
		jingdianjieshao : false,
		luxiantupian : false,
		qidian : false,
		tujingluduan : false,
		mudedi : false,
		chuxingfangshi : false,
		luxianjieshao : false,
		xingchengtianshu : false,
		xingchenganpai : false,
		storeupnum : false,
		clicknum : false,
	})
	const isAdd = ref(false)
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		luxianmingcheng: [
		],
		jingdianmingcheng: [
		],
		jingdianjieshao: [
		],
		luxiantupian: [
		],
		qidian: [
		],
		tujingluduan: [
		],
		mudedi: [
		],
		chuxingfangshi: [
		],
		luxianjieshao: [
		],
		xingchengtianshu: [
		],
		xingchenganpai: [
		],
		storeupnum: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		clicknum: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
	})
	//路线图片上传回调
	const luxiantupianUploadSuccess=(e)=>{
		form.value.luxiantupian = e
	}
	//methods

	//methods
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			res.data.data.xingchenganpai = res.data.data.xingchenganpai.replace(reg,'../../../cl9446836/file');
			form.value = res.data.data
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init = (formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null) => {
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			// getInfo()
			for(let x in row){
				if(x=='luxianmingcheng'){
					form.value.luxianmingcheng = row[x];
					disabledForm.value.luxianmingcheng = true;
					continue;
				}
				if(x=='jingdianmingcheng'){
					form.value.jingdianmingcheng = row[x];
					disabledForm.value.jingdianmingcheng = true;
					continue;
				}
				if(x=='jingdianjieshao'){
					form.value.jingdianjieshao = row[x];
					disabledForm.value.jingdianjieshao = true;
					continue;
				}
				if(x=='luxiantupian'){
					form.value.luxiantupian = row[x];
					disabledForm.value.luxiantupian = true;
					continue;
				}
				if(x=='qidian'){
					form.value.qidian = row[x];
					disabledForm.value.qidian = true;
					continue;
				}
				if(x=='tujingluduan'){
					form.value.tujingluduan = row[x];
					disabledForm.value.tujingluduan = true;
					continue;
				}
				if(x=='mudedi'){
					form.value.mudedi = row[x];
					disabledForm.value.mudedi = true;
					continue;
				}
				if(x=='chuxingfangshi'){
					form.value.chuxingfangshi = row[x];
					disabledForm.value.chuxingfangshi = true;
					continue;
				}
				if(x=='luxianjieshao'){
					form.value.luxianjieshao = row[x];
					disabledForm.value.luxianjieshao = true;
					continue;
				}
				if(x=='xingchengtianshu'){
					form.value.xingchengtianshu = row[x];
					disabledForm.value.xingchengtianshu = true;
					continue;
				}
				if(x=='xingchenganpai'){
					form.value.xingchenganpai = row[x];
					disabledForm.value.xingchenganpai = true;
					continue;
				}
				if(x=='storeupnum'){
					form.value.storeupnum = row[x];
					disabledForm.value.storeupnum = true;
					continue;
				}
				if(x=='clicknum'){
					form.value.clicknum = row[x];
					disabledForm.value.clicknum = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			form.value.storeupnum='0'
			form.value.clicknum='0'
		}
		context?.$http({
			url: `${context?.$toolUtil.storageGet('frontSessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
		})
	}
	//初始化
	//取消
	const backClick = () => {
		history.back()
	}
	//富文本数据回调
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		if(form.value.luxiantupian!=null) {
			form.value.luxiantupian = form.value.luxiantupian.replace(new RegExp(context?.$config.url,"g"),"");
		}
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									history.back()
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							history.back()
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
	onMounted(()=>{
		type.value = route.query.type?route.query.type:'add'
		let row = null
		let table = null
		let statusColumnName = null
		let tips = null
		let statusColumnValue = null
		if(type.value == 'cross'){
			row = context?.$toolUtil.storageGet('crossObj')?JSON.parse(context?.$toolUtil.storageGet('crossObj')):{}
			table = context?.$toolUtil.storageGet('crossTable')
			statusColumnName = context?.$toolUtil.storageGet('crossStatusColumnName')
			tips = context?.$toolUtil.storageGet('crossTips')
			statusColumnValue = context?.$toolUtil.storageGet('crossStatusColumnValue')
		}
		init(route.query.id?route.query.id:null, type.value,'', row, table, statusColumnName, tips, statusColumnValue)
	})
	
</script>
<style lang="scss" scoped>
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
	// 表单
	.add_form{
		border: 1px solid #eee;
		border-radius: 0px;
		padding: 30px 7%;
		background: #f8f8f8;
		// form item
		:deep(.el-form-item) {
			border: 0px solid #eee;
			padding: 6px 0;
			margin: 0 0 20px 0;
			background: none;
			display: flex;
			//label
			.el-form-item__label {
			 background: none;
			 display: block;
			 width: auto;
			 min-width: 150px;
			 text-align: right;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 150px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					border: 1px solid #ddd;
					padding: 0 10px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					height: 36px;
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
				// 富文本
				.list_editor {
					background-color: #fff;
					border-radius: 0;
					padding: 0;
					margin: 0;
					width: 99%;
					border-color: #eee;
					border-width: 0;
					border-style: solid;
					height: auto;
				}
				// 长文本
				.el-textarea__inner {
					border: 1px solid #ddd;
					border-radius: 0px;
					padding: 12px;
					color: #666;
					width: 100%;
					font-size: 14px;
					min-height: 120px;
				}
				//图片上传样式
				.el-upload-list  {
					//提示语
					.el-upload__tip {
						margin: 7px 0 0;
						color: #999;
						display: flex;
						font-size: 14px;
						justify-content: flex-start;
						align-items: center;
					}
					//外部盒子
					.el-upload--picture-card {
						border: 1px solid #ddd;
						cursor: pointer;
						border-radius: 0px;
						background: #fff;
						width: 120px;
						line-height: 90px;
						text-align: center;
						height: 80px;
						//图标
						.el-icon{
							color: #999;
							font-size: 32px;
						}
					}
					.el-upload-list__item {
						border: 1px solid #ddd;
						cursor: pointer;
						border-radius: 0px;
						background: #fff;
						width: 120px;
						line-height: 90px;
						text-align: center;
						height: 80px;
					}
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: center;
		.formModel_cancel {
			border: 0;
			cursor: pointer;
			border-radius: 0px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #fff;
			background: #999;
			width: auto;
			font-size: 14px;
			height: 36px;
		}
		.formModel_cancel:hover {
			background: #99999980;
		}
		
		.formModel_confirm {
			border: 0;
			cursor: pointer;
			border-radius: 0px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #fff;
			background: #c00;
			width: auto;
			font-size: 14px;
			height: 36px;
		}
		.formModel_confirm:hover {
			background: #cc000080;
		}
	}
</style>