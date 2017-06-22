import { createStore } from 'redux';
import webookEditReducer from '../reducers/webookEditReducer';

const configureStore = (railsProps) => (
  createStore(webookEditReducer, railsProps)
);

export default configureStore;
