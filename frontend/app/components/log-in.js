import Ember from 'ember';
import { validator, buildValidations } from 'ember-cp-validations';

var Validations = buildValidations({
  email: [
    validator('presence', true),
    validator('format', {
      type: 'email',
      regex:  /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
    })
  ],
  password: [
    validator('presence', true),
    validator('length', {
      min: 8,
      max: 32
    })
  ]
});

export default Ember.Component.extend(Validations, {
  actions: {

    passwordNew() {
      this.sendAction('open', 'password-new');
    },

    logIn(){
      this.set('currentUser.password', this.get('password'));
      this.set('currentUser.email', this.get('email'));
      let _this = this;
      this.get('currentUser').authenticate().then(
        function () {
          _this.set('currentUser.isLogInError', false);
          _this.sendAction('close');
          window.location.replace('/');
        }, function (data) {
          _this.set('currentUser.logInError', data.error);
          _this.set('currentUser.isLogInError', true);
        });
    },

    signUp() {
      this.sendAction('close');
      this.sendAction('open', 'sign-up');
    }

  }

});
