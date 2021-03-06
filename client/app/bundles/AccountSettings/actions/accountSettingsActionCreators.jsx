import * as api from '../api';

export const updateKindleEmail = (kindleEmail) => (dispatch) => {
  dispatch({ type: "UPDATE_KINDLE_EMAIL_START" });
  api.updateKindleEmail(kindleEmail).then(response => {
    dispatch({
      type: "UPDATE_KINDLE_EMAIL_SUCCESS",
      kindleEmail,
    })
  });
};

export const dismissNotification = () => ({
  type: "DISMISS_NOTIFICATION",
});
