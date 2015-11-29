import Ember from 'ember';
import { validator, buildValidations } from 'ember-cp-validations';

var Validations = buildValidations({
  password: [
    validator('presence', true),
    validator('length', {
      min: 8,
      max: 32
    })
  ],
  verifiedPassword:validator('confirmation', {
    on: 'password',
    message: 'do not match'
  })
});

export default Ember.Component.extend(Validations, {

  actions:{
    createNewPassword(){
      let _this = this;
      let queryParams = this.get('currentUser.qParams');
      Ember.$.ajax({
        url: '/auth/password',
        dataType: 'json',
        method: 'put',
        beforeSend(xhr) {
          xhr.setRequestHeader('access-token', queryParams['token']);
          xhr.setRequestHeader('client', queryParams['client_id']);
          xhr.setRequestHeader('uid', queryParams['uid']);
        },
        data:{
          password:              this.get('password'),
          password_confirmation: this.get('verifiedPassword')
        }
      }).then(
        function() {
          _this.sendAction('close');
          _this.sendAction('openHint', 'hint-password-success');
          _this.set('isNewPasswordError', false);
        },
        function(data) {
          _this.set('newPasswordError', data.responseJSON.errors);
          _this.set('isNewPasswordError', true);
        }
      );
    }
  }
});

