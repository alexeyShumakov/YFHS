import Ember from 'ember';
import BaseValidator from 'ember-cp-validations/validators/base';

export default BaseValidator.extend({
  store: Ember.inject.service(),

  validate(value) {
    let regexpMail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    if (regexpMail.test(value)){
      return this.get('store').query('user', {filter: {email: value}}).then(
        function(users){
          if (Ember.isBlank(users)){
            return true;
          } else {
            return 'email already exist.';
          }
        }
      );
    }
  }
});
