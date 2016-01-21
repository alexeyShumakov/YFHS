import Ember from 'ember';

export default Ember.Service.extend({
  companyPublicNickname: null,
  currentUser: Ember.inject.service(),
  subscribe(){
    if (this.get('currentUser.isLogIn')) {
      MessageBus.start();
      MessageBus.callbackInterval = 500;
    }
  }
});
