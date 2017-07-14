import React from 'react';

const SuccessNotification = ({ isVisible, isDismissed, onDismiss }) => {
  if (isVisible && !isDismissed) {
    return (
      <div className="alert alert-success fade show">
        <button type="button" className="close" onClick={onDismiss}>
          <span aria-hidden="true">&times;</span>
        </button>
        <strong>Well done!</strong> Your kindle email has been successfuly updated.
      </div>
      )
  } else {
    return <div></div>
  }
};

export default SuccessNotification;