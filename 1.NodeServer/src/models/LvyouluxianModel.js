import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 旅游路线
const LvyouluxianModel = sequelize.define('LvyouluxianModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	luxianmingcheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '路线名称'
	},
	jingdianmingcheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '景点名称'
	},
	jingdianjieshao: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '景点介绍'
	},
	luxiantupian: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '路线图片'
	},
	qidian: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '起点'
	},
	tujingluduan: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '途径路段'
	},
	mudedi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '目的地'
	},
	chuxingfangshi: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '出行方式'
	},
	luxianjieshao: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '路线介绍'
	},
	xingchengtianshu: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '行程天数'
	},
	xingchenganpai: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '行程安排'
	},
	storeupnum: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '收藏数量'
	},
	clicknum: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '点击次数'
	},
	addtime: {
  		type: DataTypes.DATE,
  		defaultValue: DataTypes.NOW,
    	allowNull: false,
    	get() {
            return moment(this.getDataValue('addtime')).format('YYYY-MM-DD HH:mm:ss')
        },
		comment: '添加时间'
	}
}, {
	timestamps: false,
	freezeTableName: true,
	tableName: 'lvyouluxian'
})

export default LvyouluxianModel
