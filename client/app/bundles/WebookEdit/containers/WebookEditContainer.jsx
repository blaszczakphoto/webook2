// Simple example of a React "smart" component

import { connect } from 'react-redux';
import WebookEdit from '../components/WebookEdit';
import * as actions from '../actions/webookEditActionCreators';

// Which part of the Redux global state does our component want to receive as props?
const mapStateToProps = (state) => ({
  name: state.name,
  urls: state.urls,
  action: state.action,
  form_authenticity_token: state.form_authenticity_token,
});

// Don't forget to actually use connect!
// Note that we don't export WebookEdit, but the redux "connected" version of it.
// See https://github.com/reactjs/react-redux/blob/master/docs/api.md#examples
export default connect(mapStateToProps, actions)(WebookEdit);
