// Simple example of a React "smart" component

import { connect } from 'react-redux';
import AccountSettings from '../components/AccountSettings';
import * as actions from '../actions/accountSettingsActionCreators';

// Which part of the Redux global state does our component want to receive as props?
const mapStateToProps = (state) => ({
  kindleEmail: state.kindleEmail,
  kindleEmialUpdatingFinished: state.kindleEmialUpdatingFinished,
  isDismissed: state.isDismissed,
});

export default connect(mapStateToProps, actions)(AccountSettings);
