import Ember from 'ember';

export function online(date/*, hash*/) {
  let updatedTime = moment(date[0]);
  if (updatedTime > moment().subtract(10, 'minutes')){
    return 'online';
  } else {
    if (updatedTime > moment().subtract(1, 'day')){
      return "был в сети " + updatedTime.locale('ru').fromNow();
    } else {
      return "был в сети " + updatedTime.locale('ru').format('Do MMMM YYYY');
    }
  }
}

export default Ember.Helper.helper(online);
