import { combineReducers } from 'redux';
import { HELLO_WORLD_NAME_UPDATE } from '../constants/webookEditConstants';

const name = (state = '', action) => {
  switch (action.type) {
    case HELLO_WORLD_NAME_UPDATE:
      return action.text;
    default:
      return state;
  }
};

const urls = (state = ["www.wp.pl/balcerowicz-musi-odejsc.html"], action) => {
  switch (action.type) {
    case 'WEBOOK_EDIT_ADD_URL':
      return [...state, action.url];
    default:
      return state;
  }
}

const webookEditReducer = combineReducers({ name, urls });

export default webookEditReducer;
