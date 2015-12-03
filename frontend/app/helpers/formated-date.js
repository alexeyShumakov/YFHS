import Ember from 'ember';

export function formatedDate(date/*, hash*/) {
  return moment(date[0]).locale('ru').fromNow()
}

export default Ember.Helper.helper(formatedDate);
