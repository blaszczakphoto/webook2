import PropTypes from 'prop-types';
import React from 'react';

const WebookEdit = ({ name, updateName, addUrl, urls }) => (
  <div>
    <form>
      <div className="form-group">
        <label>Webook title</label>
        <input className="form-control" id="webook-title" type="text" placeholder="Type webook title ..." />
      </div>
      <div className="form-group">
        <label>Paste new url</label>
        <input 
          id="webook-url" 
          className="form-control" 
          type="text" 
          placeholder="Paste new url ..." 
          onPaste={(e) => {
            let pastedUrl = e.clipboardData.getData('Text');
            addUrl(pastedUrl);
          }}
        />
      </div>
    </form>

    <ul className="c-webooks-urls-list">
      {urls.map((url) => {
        return(
          <li className="c-webooks-urls-list__url">
            {url} 
            <button 
              type="button" 
              className="btn btn-danger btn-sm c-delete-url-btn"
            >x</button>
          </li>
        )
      })}
    </ul>
  </div>
);

WebookEdit.propTypes = {
  name: PropTypes.string.isRequired,
  updateName: PropTypes.func.isRequired,
};

export default WebookEdit;
