import { combineReducers } from 'redux';
import { HELLO_WORLD_NAME_UPDATE } from '../constants/webookEditConstants';
import { v4 } from 'uuid';
const name = (state = '', action) => {
  switch (action.type) {
    case HELLO_WORLD_NAME_UPDATE:
      return action.text;
    default:
      return state;
  }
};

const urls = (state = [], action) => {
  switch (action.type) {
    case 'WEBOOK_EDIT_ADD_URL':
      return [...state, {body: action.url, id: v4()}];
    default:
      return state;
  }
}

const action = (state = "", action) => {
  switch(action.type) {
    default:
      return state;
  }
}

const form_authenticity_token = (state = "", action) => {
  switch(action.type) {
    default:
      return state;
  }
}

const webookEditReducer = combineReducers({ name, urls, form_authenticity_token, action });

export default webookEditReducer;
