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
      console.log(this.get('model'));
      let _this = this;
      Ember.$.ajax({
        url: '/users/password',
        dataType: 'json',
        method: 'put',
        data:{
          user:{
            password:              this.get('password'),
            password_confirmation: this.get('verifiedPassword'),
            reset_password_token:  this.get('model')
          }
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

