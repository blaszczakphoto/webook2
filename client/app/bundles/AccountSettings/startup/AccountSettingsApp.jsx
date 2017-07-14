import React from 'react';
import { Provider } from 'react-redux';

import configureStore from '../store/accountSettingsStore';
import AccountSettingsContainer from '../containers/AccountSettingsContainer';

const AccountSettingsApp = (props, _railsContext) => (
  <Provider store={configureStore(props)}>
    <AccountSettingsContainer />
  </Provider>
);

export default AccountSettingsApp;
