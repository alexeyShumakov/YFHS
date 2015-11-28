import Ember from 'ember';
import BaseValidator from 'ember-cp-validations/validators/base';

export default BaseValidator.extend({
  store: Ember.inject.service(),

  validate(value) {
    if (Ember.isBlank(value)){ value = '';}
    let regexp= /^(\w+){4,64}$/;
    if (regexp.test(value)){
      return this.get('store').query('user', {filter: {nickname: value}}).then(
        function(users){
          if (Ember.isBlank(users)){
            return true;
          } else {
            return 'nickname already exist.';
          }
        }
      );
    }
  }
});
