import Ember from 'ember';

export default Ember.Component.extend({
  actions: {

    passwordNew() {
      this.sendAction('open', 'password-new');
    },

    logIn(){
      let _this = this;
      this.get('currentUser').authenticate().then(
        function(){
          _this.set('currentUser.isLogInError', false);
          _this.sendAction('close');
        }, function(data) {
            _this.set('currentUser.logInError', data.errors);
            _this.set('currentUser.isLogInError', true);
        });
    },

    signUp() {
      this.sendAction('close');
      this.sendAction('open', 'sign-up');
    }

  }

});
