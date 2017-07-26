import { createStore, applyMiddleware } from 'redux';
import accountSettingsReducer from '../reducers/accountSettingsReducer';
import logger from 'redux-logger';
import thunk from 'redux-thunk';
const middlewares = [thunk];
if (process.env.NODE_ENV === 'development') {
  middlewares.push(logger);
}


const configureStore = (railsProps) => (
  createStore(accountSettingsReducer, railsProps, applyMiddleware(...middlewares))
);

export default configureStore;
