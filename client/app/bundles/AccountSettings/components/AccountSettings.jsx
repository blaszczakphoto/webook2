import PropTypes from 'prop-types';
import React from 'react';

const AccountSettings = ({ updateKindleEmail, kindleEmail }) => {
  let emailInput;
  return (
    <form>
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
