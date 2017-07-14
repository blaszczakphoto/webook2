import { createStore } from 'redux';
import accountSettingsReducer from '../reducers/accountSettingsReducer';

const configureStore = (railsProps) => (
  createStore(accountSettingsReducer, railsProps)
);

export default configureStore;
