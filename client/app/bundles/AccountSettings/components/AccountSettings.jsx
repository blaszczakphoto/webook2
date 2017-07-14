import PropTypes from 'prop-types';
import React from 'react';
import SuccessNotification from './SuccessNotification';

const AccountSettings = ({ 
  updateKindleEmail, 
  dismissNotification, 
  isDismissed,
  kindleEmail, 
  kindleEmialUpdatingFinished }) => {

  let emailInput;
  return (
    <form>
      <SuccessNotification 
        isVisible={kindleEmialUpdatingFinished}
        onDismiss={dismissNotification}
        isDismissed={isDismissed}  
      />
      <div className="form-group">
        <input
          type="text"
          placeholder="Type your kindle email..."
          className="form-control"
          defaultValue={kindleEmail}
          ref={ el => emailInput = el }
        />
      </div>
      <button
        className="btn btn-primary"
        onClick={(e) => {
          e.preventDefault();
          updateKindleEmail(emailInput.value);
        }}
      >Save</button>
    </form>
  )
};

export default AccountSettings;
