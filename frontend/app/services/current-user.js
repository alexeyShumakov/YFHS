import Ember from 'ember';

export default Ember.Service.extend({
  session: Ember.inject.service(),
  store: Ember.inject.service(),
  email: '',
  password: '',
  passwordConfirmation: '',
  logInError: '',
  isLogInError: false,
  isLogIn: Ember.computed.alias('session.isAuthenticated'),
  loading: true,

  headers: Ember.computed('session.isAuthenticated', function(){
    let email = this.get('session.session.content.authenticated.email');
    let token = this.get('session.session.content.authenticated.authentication_token');
   return {
    'X-User-Email': email,
    'X-User-Token': token
    }
  }),

  setCurrentUser(){
    let userId = this.get('session.session.content.authenticated.id');
    var _this = this;
    if (this.get('isLogIn')){
      return this.get('store').findRecord('user', userId).then(
        function (user) {
          _this.set('user', user);
        }, function() {
          _this.invalidate();

        });
    } else {
      if (Ember.isPresent(this.get('user'))){
        this.get('user').unloadRecord();
      }
    }
  },
  some: Ember.observer('isLogIn', function(){
    this.setCurrentUser();
  }),
  invalidate() {
    return this.get('session').invalidate();
  },
  authenticate() {
    let password = this.get('password');
    let identification = this.get('email');
    return this.get('session').authenticate('authenticator:devise', identification, password);
  },
  canEdit(model) {
    if (this.get('isLogIn')){
      return this.get('user.isAdmin') || this.get('user').isAuthor(model);
    } else {
      return false;
    }
  }

});
