import PropTypes from 'prop-types';
import React from 'react';

const WebookEdit = ({ name, updateName, addUrl, urls, action, form_authenticity_token }) => (
  <form action={action} method="post">
    <input type="hidden" name="authenticity_token" value={form_authenticity_token} />
    <div className="form-group">
      <label>Webook title</label>
      <input className="form-control" name="book_name" id="webook-title" type="text" placeholder="Type webook title ..." />
    </div>
    <div className="form-group">
      <label>Paste new url</label>
      <input 
        id="webook-url" 
        className="form-control" 
        type="text" 
        placeholder="Paste new url ..."
        value="" 
        onPaste={(e) => {
          let pastedUrl = e.clipboardData.getData('Text');
          addUrl(pastedUrl);
        }}
      />
    </div>

    <ul className="c-webooks-urls-list">
      {urls.map((url) => {
        let hidden_input_name = `urls[]`;
        return(
          <li key={url.id} className="c-webooks-urls-list__url">
            {url.body} 
            <button 
              type="button" 
              className="btn btn-danger btn-sm c-delete-url-btn"
            >x</button>
            <input type="hidden" value={url.body} name={hidden_input_name} />
          </li>
        )
      })}
    </ul>
  </form>
);

WebookEdit.propTypes = {
  name: PropTypes.string.isRequired,
  updateName: PropTypes.func.isRequired,
};

export default WebookEdit;
