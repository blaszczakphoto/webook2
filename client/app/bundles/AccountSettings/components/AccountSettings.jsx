import PropTypes from 'prop-types';
import React from 'react';

const AccountSettings = () => (
  <form>
    <div className="form-group">
      <input
        type="text"
        placeholder="Type your kindle email..."
        className="form-control"
      />
    </div>
    <button className="btn btn-primary">Save</button>
  </form>
);



export default AccountSettings;
