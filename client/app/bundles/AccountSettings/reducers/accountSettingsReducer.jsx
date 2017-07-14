import { combineReducers } from 'redux';

const kindleEmail = (state = '', action) => {
  switch (action.type) {
    case "UPDATE_KINDLE_EMAIL_SUCCESS":
      return action.kindleEmail;
    default:
      return state;
  }
};

const kindleEmialUpdatingFinished = (state = false, action) => {
  switch (action.type) {
    case "UPDATE_KINDLE_EMAIL_START":
     return false;
    case "UPDATE_KINDLE_EMAIL_END":
      return true;
    default:
      return state;
  }
};


const isDismissed = (state = false, action) => {
  switch (action.type) {
    case "DISMISS_NOTIFICATION":
     return true;
    case "UPDATE_KINDLE_EMAIL_START":
    case "UPDATE_KINDLE_EMAIL_END":
    case "UPDATE_KINDLE_EMAIL":
      return false;
    default:
      return state;
  }
};


const accountSettingsReducer = combineReducers({ 
  kindleEmail, kindleEmialUpdatingFinished, isDismissed });

export default accountSettingsReducer;
