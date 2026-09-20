import { version } from '../../package.json'
import { Router } from 'express'
import { Sequelize, Op, QueryTypes } from 'sequelize'
import sequelize from '../models/sequelize'
import toRes from '../lib/toRes'
import LvyouluxianModel from '../models/LvyouluxianModel'
import md5 from 'md5-node'
import util from '../lib/util'
import jwt from 'jsonwebtoken'
import moment from 'moment'
import ConfigModel from '../models/ConfigModel'
import https from 'https'
import request from 'request'
import qs from 'querystring'
import path from 'path'
import fs from 'fs'




export default ({ config, db }) => {
	let api = Router()


	// 分页接口（后端）
	api.get('/page', async (req, res) => {

		try {

			let page = parseInt(req.query.page) || 1
			let limit = parseInt(req.query.limit) || 10
			let sort = req.query.sort || 'id'
			let order = req.query.order || 'asc'

			let where = {}
			let luxianmingcheng = req.query.luxianmingcheng
			if (luxianmingcheng) {

				if (luxianmingcheng.indexOf('%') != -1) {
					where.luxianmingcheng = {
						[Op.like]: luxianmingcheng
					}
				} else {
					where.luxianmingcheng = {
						[Op.eq]: luxianmingcheng
					}
				}
			}
			let jingdianmingcheng = req.query.jingdianmingcheng
			if (jingdianmingcheng) {

				if (jingdianmingcheng.indexOf('%') != -1) {
					where.jingdianmingcheng = {
						[Op.like]: jingdianmingcheng
					}
				} else {
					where.jingdianmingcheng = {
						[Op.eq]: jingdianmingcheng
					}
				}
			}
			let jingdianjieshao = req.query.jingdianjieshao
			if (jingdianjieshao) {

				if (jingdianjieshao.indexOf('%') != -1) {
					where.jingdianjieshao = {
						[Op.like]: jingdianjieshao
					}
				} else {
					where.jingdianjieshao = {
						[Op.eq]: jingdianjieshao
					}
				}
			}
			let luxiantupian = req.query.luxiantupian
			if (luxiantupian) {

				if (luxiantupian.indexOf('%') != -1) {
					where.luxiantupian = {
						[Op.like]: luxiantupian
					}
				} else {
					where.luxiantupian = {
						[Op.eq]: luxiantupian
					}
				}
			}
			let qidian = req.query.qidian
			if (qidian) {

				if (qidian.indexOf('%') != -1) {
					where.qidian = {
						[Op.like]: qidian
					}
				} else {
					where.qidian = {
						[Op.eq]: qidian
					}
				}
			}
			let tujingluduan = req.query.tujingluduan
			if (tujingluduan) {

				if (tujingluduan.indexOf('%') != -1) {
					where.tujingluduan = {
						[Op.like]: tujingluduan
					}
				} else {
					where.tujingluduan = {
						[Op.eq]: tujingluduan
					}
				}
			}
			let mudedi = req.query.mudedi
			if (mudedi) {

				if (mudedi.indexOf('%') != -1) {
					where.mudedi = {
						[Op.like]: mudedi
					}
				} else {
					where.mudedi = {
						[Op.eq]: mudedi
					}
				}
			}
			let chuxingfangshi = req.query.chuxingfangshi
			if (chuxingfangshi) {

				if (chuxingfangshi.indexOf('%') != -1) {
					where.chuxingfangshi = {
						[Op.like]: chuxingfangshi
					}
				} else {
					where.chuxingfangshi = {
						[Op.eq]: chuxingfangshi
					}
				}
			}
			let luxianjieshao = req.query.luxianjieshao
			if (luxianjieshao) {

				if (luxianjieshao.indexOf('%') != -1) {
					where.luxianjieshao = {
						[Op.like]: luxianjieshao
					}
				} else {
					where.luxianjieshao = {
						[Op.eq]: luxianjieshao
					}
				}
			}
			let xingchengtianshu = req.query.xingchengtianshu
			if (xingchengtianshu) {

				if (xingchengtianshu.indexOf('%') != -1) {
					where.xingchengtianshu = {
						[Op.like]: xingchengtianshu
					}
				} else {
					where.xingchengtianshu = {
						[Op.eq]: xingchengtianshu
					}
				}
			}
			let xingchenganpai = req.query.xingchenganpai
			if (xingchenganpai) {

				if (xingchenganpai.indexOf('%') != -1) {
					where.xingchenganpai = {
						[Op.like]: xingchenganpai
					}
				} else {
					where.xingchenganpai = {
						[Op.eq]: xingchenganpai
					}
				}
			}
			let storeupnum = req.query.storeupnum
			if (storeupnum) {

				if (storeupnum.indexOf('%') != -1) {
					where.storeupnum = {
						[Op.like]: storeupnum
					}
				} else {
					where.storeupnum = {
						[Op.eq]: storeupnum
					}
				}
			}
			let clicknum = req.query.clicknum
			if (clicknum) {

				if (clicknum.indexOf('%') != -1) {
					where.clicknum = {
						[Op.like]: clicknum
					}
				} else {
					where.clicknum = {
						[Op.eq]: clicknum
					}
				}
			}

			let result = await LvyouluxianModel.findAndCountAll({
				order: [[sort, order]],
				where,
				offset: (page - 1) * limit,
				limit
			})
			
			result.currPage = page
			result.pageSize = limit

			toRes.page(res, 0, result)
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

    // 分页接口（前端）
	api.get('/list', async (req, res) => {

		try {

			let page = parseInt(req.query.page) || 1
			let limit = parseInt(req.query.limit) || 10
			let sort = req.query.sort || 'id'
			let order = req.query.order || 'asc'

			let where = {}
			let luxianmingcheng = req.query.luxianmingcheng
			if (luxianmingcheng) {

				if (luxianmingcheng.indexOf('%') != -1) {
					where.luxianmingcheng = {
						[Op.like]: luxianmingcheng
					}
				} else {
					where.luxianmingcheng = {
						[Op.eq]: luxianmingcheng
					}
				}
			}
			let jingdianmingcheng = req.query.jingdianmingcheng
			if (jingdianmingcheng) {

				if (jingdianmingcheng.indexOf('%') != -1) {
					where.jingdianmingcheng = {
						[Op.like]: jingdianmingcheng
					}
				} else {
					where.jingdianmingcheng = {
						[Op.eq]: jingdianmingcheng
					}
				}
			}
			let qidian = req.query.qidian
			if (qidian) {

				if (qidian.indexOf('%') != -1) {
					where.qidian = {
						[Op.like]: qidian
					}
				} else {
					where.qidian = {
						[Op.eq]: qidian
					}
				}
			}


			let result = await LvyouluxianModel.findAndCountAll({
				order: [[sort, order]],
				where,
				offset: (page - 1) * limit,
				limit
			})
			
			result.currPage = page
			result.pageSize = limit

			toRes.page(res, 0, result)
		} catch(err) {
			toRes.session(res, 401, err.message, '', 200)
		}
	})


	// 保存接口（后端）
	api.post('/save', async (req, res) => {

		try {

			Object.keys(req.body).forEach(item=>{
				if(req.body[item] == '')  delete req.body[item]
			})



			const userinfo = await LvyouluxianModel.create(req.body)

			if (userinfo === null) {

				toRes.session(res, -1, '添加失败！')
			} else {

				toRes.session(res, 0, '添加成功！')
			}
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

    // 保存接口（前端）
	api.post('/add', async (req, res) => {

		try {

			Object.keys(req.body).forEach(item=>{
				if(req.body[item] == '')  delete req.body[item]
			})

			if (jwt.decode(req.headers.token) == null) {
				toRes.session(res, 401, '请登录后再操作', '', 401)
			}



			const userinfo = await LvyouluxianModel.create(req.body)

			if (userinfo === null) {

				toRes.session(res, -1, '添加失败！')
			} else {

				toRes.session(res, 0, '添加成功！')
			}
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 更新接口
	api.post('/update', async (req, res) => {

		try {



			await LvyouluxianModel.update(req.body, {
				where: {
				  id: req.body.id || 0
				}
			})


			toRes.session(res, 0, '编辑成功！')
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 删除接口
	api.post('/delete', async (req, res) => {

		try {

			await LvyouluxianModel.destroy({
				where: {
				  id: {
					[Op.in]: req.body
				  }
				}
			})

			toRes.session(res, 0, '删除成功！')
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 详情接口（后端）
	api.all('/info/:id', async (req, res) => {

		try {

			const recordInfo = await LvyouluxianModel.findOne({ where: { id: req.params.id } })
            await recordInfo.increment('clicknum')

			toRes.record(res, 0, await LvyouluxianModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

    // 详情接口（前端）
	api.all('/detail/:id', async (req, res) => {

		try {

			const recordInfo = await LvyouluxianModel.findOne({ where: { id: req.params.id } })
            await recordInfo.increment('clicknum')

			toRes.record(res, 0, await LvyouluxianModel.findOne({ where: { id: req.params.id } }))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 获取需要提醒的记录数接口
	api.get('/remind/:columnName/:type', async (req, res) => {

		try {

			let sql = 'SELECT 0 AS count'
			
			if (req.params.type == 1) {
				if (req.query.remindstart) sql = "SELECT COUNT(*) AS count FROM lvyouluxian WHERE " + req.params.columnName + " >= '" + req.query.remindstart + "'"
				if (req.query.remindend) sql = "SELECT COUNT(*) AS count FROM lvyouluxian WHERE " + req.params.columnName + " <= '" + req.query.remindend + "'"

				if (req.query.remindstart && req.query.remindend) {
					sql = "SELECT COUNT(*) AS count FROM lvyouluxian WHERE " + req.params.columnName + " >= '" + req.query.remindstart + "' AND " + req.params.columnName + " <= '" + req.query.remindend + "'"
				}
			}

			if (req.params.type == 2) {
				if (req.query.remindstart) {
					let remindStart = util.getDateTimeFormat(0 + Number(req.query.remindstart), "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM lvyouluxian WHERE " + req.params.columnName + " >= '" + remindStart + "'"
				}
				if (req.query.remindend) {
					let remindEnd = util.getDateTimeFormat(req.query.remindend, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM lvyouluxian WHERE " + req.params.columnName + " <= '" + remindEnd + "'"
				}

				if (req.query.remindstart && req.query.remindend) {
					let remindStart = util.getDateTimeFormat(0 + Number(req.query.remindstart), "yyyy-MM-dd")
					let remindEnd = util.getDateTimeFormat(req.query.remindend, "yyyy-MM-dd")
					sql = "SELECT COUNT(*) AS count FROM lvyouluxian WHERE " + req.params.columnName + " >= '" + remindStart + "' AND " + req.params.columnName + " <= '" + remindEnd + "'"
				}
			}

			const results = await sequelize.query(sql, {
				plain: true,
				raw: true,
				type: QueryTypes.SELECT
			})

			toRes.count(res, 0, results.count)
		} catch(err) {
			
			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})










	// 分组统计接口
	api.get('/group/:columnName', async (req, res) => {

		try {

			let sql = ""
			let columnName = req.params.columnName
			// let tableName = "lvyouluxian"
			let where = " WHERE 1 = 1 "
			sql = "SELECT COUNT(*) AS total, " + columnName + " FROM lvyouluxian " + where + " GROUP BY " + columnName + " LIMIT 10" 
			toRes.record(res, 0, await sequelize.query(sql, {
				plain: false,
				raw: true,
				type: QueryTypes.SELECT
			}))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 统计指定字段
	api.get('/value/:xColumnName/:yColumnName', async (req, res) => {

		try {

			let sql = ""
			let xColumnName = req.params.xColumnName
			let yColumnName = req.params.yColumnName
			// let tableName = "lvyouluxian"
			let where = " WHERE 1 = 1 "
			if ("lvyouluxian" == "orders") {
				where += " AND status IN ('已支付', '已发货', '已完成') ";
			}

			sql = "SELECT " + xColumnName + ", SUM(" + yColumnName + ") AS total FROM lvyouluxian " + where + " GROUP BY " + xColumnName + " DESC LIMIT 10"
			
			toRes.record(res, 0, await sequelize.query(sql, {
				plain: false,
				raw: true,
				type: QueryTypes.SELECT
			}))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})

	// 按日期统计
	api.get('/value/:xColumnName/:yColumnName/:timeStatType', async (req, res) => {

		try {
			
			let sql = ""
			let xColumnName = req.params.xColumnName
			let yColumnName = req.params.yColumnName
			let timeStatType = req.params.timeStatType
			let tableName = "lvyouluxian"
			let where = " WHERE 1 = 1 "
			if ("lvyouluxian" == "orders") {
				where += " AND status IN ('已支付', '已发货', '已完成') ";
			}

            if (config.dbConnection.dbtype.toLowerCase() == "mysql") {
                if (timeStatType == "日")
                    sql = "SELECT DATE_FORMAT(" + xColumnName + ", '%Y-%m-%d') " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(" + xColumnName + ", '%Y-%m-%d') LIMIT 10";
                if (timeStatType == "月")
                    sql = "SELECT DATE_FORMAT(" + xColumnName + ", '%Y-%m') " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(" + xColumnName + ", '%Y-%m')  LIMIT 10";
                if (timeStatType == "年")
                    sql = "SELECT DATE_FORMAT(" + xColumnName + ", '%Y') " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(" + xColumnName + ", '%Y')  LIMIT 10";
            } else {
                if (timeStatType == "日")
                    sql = "SELECT DATE_FORMAT(VARCHAR(10)," + xColumnName + ", 120) " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(VARCHAR(10)," + xColumnName + ", 120)  LIMIT 10";
                if (timeStatType == "月")
                    sql = "SELECT DATE_FORMAT(VARCHAR(7)," + xColumnName + ", 120) " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(VARCHAR(7)," + xColumnName + ", 120)  LIMIT 10";
                if (timeStatType == "年")
                    sql = "SELECT DATE_FORMAT(VARCHAR(4)," + xColumnName + ", 120) " + xColumnName + ", sum(" + yColumnName + ") total FROM " + tableName + where + " GROUP BY DATE_FORMAT(VARCHAR(4)," + xColumnName + ", 120)  LIMIT 10";
            }
			toRes.record(res, 0, await sequelize.query(sql, {
				plain: false,
				raw: true,
				type: QueryTypes.SELECT
			}))
		} catch(err) {

			toRes.session(res, 500, '服务器错误！', '', 500)
		}
	})












	return api
}
