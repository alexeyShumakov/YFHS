import Ember from 'ember';

export default Ember.Service.extend({
  currentUser: Ember.inject.service(),
  data: {},
  subscribe(){
    if (this.get('currentUser.isLogIn')) {
      MessageBus.start();

      MessageBus.callbackInterval = 500;
      let _this = this;

      let userId = this.get('currentUser.session.session.content.authenticated.id');
      MessageBus.subscribe(`/users/${userId}/event`, function(data){
        _this.set('data', JSON.parse(data));
      });
    }
  },
  totalMessages: Ember.observer('data', function(){
    let totalMessages = this.get('data.totalUnreadMessages');
    if (Ember.isPresent(totalMessages)){
      this.set('currentUser.user.totalUnreadMessages', totalMessages);
    }
  })
});
