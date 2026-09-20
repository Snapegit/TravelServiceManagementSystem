import { Router } from 'express'
import UsersController from './Users'
import FileController from './File'
import ConfigController from './Config'
import CommonController from './Common'
import NewsController from './News'
import YonghuController from './Yonghu'
import JingdianxinxiController from './Jingdianxinxi'
import StoreupController from './Storeup'
import MenpiaogoumaiController from './Menpiaogoumai'
import TechanzhongxinController from './Techanzhongxin'
import JingdianfenleiController from './Jingdianfenlei'
import LvyouluxianController from './Lvyouluxian'
import MenuController from './Menu'
import DiscussjingdianxinxiController from './Discussjingdianxinxi'
import DiscusslvyouluxianController from './Discusslvyouluxian'

export default ({ config, db }) => {
	let api = Router()

	api.use('/users', UsersController({ config, db }))

	api.use('/file', FileController({ config, db }))

	api.use('/config', ConfigController({ config, db }))

	api.use('/', CommonController({ config, db }))

	api.use('/config', ConfigController({ config, db }))

	api.use('/users', UsersController({ config, db }))

	api.use('/news', NewsController({ config, db }))

	api.use('/yonghu', YonghuController({ config, db }))

	api.use('/jingdianxinxi', JingdianxinxiController({ config, db }))

	api.use('/storeup', StoreupController({ config, db }))

	api.use('/menpiaogoumai', MenpiaogoumaiController({ config, db }))

	api.use('/techanzhongxin', TechanzhongxinController({ config, db }))

	api.use('/jingdianfenlei', JingdianfenleiController({ config, db }))

	api.use('/lvyouluxian', LvyouluxianController({ config, db }))

	api.use('/menu', MenuController({ config, db }))

	api.use('/discussjingdianxinxi', DiscussjingdianxinxiController({ config, db }))

	api.use('/discusslvyouluxian', DiscusslvyouluxianController({ config, db }))

	return api
}
