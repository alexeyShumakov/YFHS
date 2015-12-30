import Ember from 'ember';
import { validator, buildValidations } from 'ember-cp-validations';

var Validations = buildValidations({
  email: [
    validator('format', {
      type: 'email',
      regex:  /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
    })
  ]
});

export default Ember.Component.extend(Validations, {
  inNewPasswordError: false,
  actions: {
    createNewPassword() {
      let _this = this;
        Ember.$.ajax({
          url: '/users/password',
          dataType: 'json',
          method: 'post',
          data:{
            user:{
              email: this.get('email')
            }
          }
      }).then(
        function() {
          _this.sendAction('close');
          _this.sendAction('openHint', 'hint-password-new');
          _this.set('isNewPasswordError', false);
        },
        function(data) {
          _this.set('newPasswordError', data.responseJSON.errors.email);
          _this.set('isNewPasswordError', true);
        }
      );
    }

  }
});
