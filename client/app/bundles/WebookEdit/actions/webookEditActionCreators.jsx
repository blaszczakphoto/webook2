/* eslint-disable import/prefer-default-export */

import { HELLO_WORLD_NAME_UPDATE } from '../constants/webookEditConstants';

export const updateName = (text) => ({
  type: HELLO_WORLD_NAME_UPDATE,
  text,
});

export const addUrl = (url) => ({
  type: "WEBOOK_EDIT_ADD_URL",
  url,
})
