import { combineReducers } from 'redux'
import paintings from './paintings'
import loader from './loadder'

export default combineReducers({
  paintings,
  loader
})
