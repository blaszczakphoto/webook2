import { combineReducers } from 'redux';

const kindleEmail = (state = 'mariusz.blaszczak@kindle.com', action) => {
  switch (action.type) {
    case "UPDATE_KINDLE_EMAIL":
      console.log("updating kindle email..", action.kindleEmail);
      return action.kindleEmail;
    default:
      return state;
  }
};

const accountSettingsReducer = combineReducers({ kindleEmail });

export default accountSettingsReducer;
