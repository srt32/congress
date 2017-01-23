import { combineReducers } from 'redux';
import { HELLO_WORLD_NAME_UPDATE  } from '../constants/helloWorldConstants';

const name = (state = '', action) => {
  switch (action.type) {
    case HELLO_WORLD_NAME_UPDATE:
      return action.text;
    default:
      return state;
  }
};

const bills = (state = [], action) => {
  switch (action.type) {
    case 'NEW_BILLS':
      return action.bills;
    default:
      return state;
  }
};

const helloWorldReducer = combineReducers({ bills, name });

export default helloWorldReducer;
