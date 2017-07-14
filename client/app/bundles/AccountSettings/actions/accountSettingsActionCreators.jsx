

export const updateKindleEmail = (kindleEmail) => (dispatch) => {
  dispatch({ type: "UPDATE_KINDLE_EMAIL_START" });
  setTimeout(() => {
    dispatch({
      type: "UPDATE_KINDLE_EMAIL_SUCCESS",
      kindleEmail,
    })
    dispatch({ type: "UPDATE_KINDLE_EMAIL_END" });
  }, 1000);
};

export const dismissNotification = () => ({
  type: "DISMISS_NOTIFICATION",
});
