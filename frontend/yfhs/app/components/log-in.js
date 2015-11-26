import Ember from 'ember';

export default Ember.Component.extend({
  actions: {

    passwordNew() {
      this.sendAction('open', 'password-new');
    },

    logIn(){
      console.log('login');
    },

    signUp() {
      this.sendAction('close');
      this.sendAction('open', 'sign-up');
    }

  }

});
