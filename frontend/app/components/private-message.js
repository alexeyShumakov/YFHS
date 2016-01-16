import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  mouseEnter(){
    let owner= this.get('message.user.email');
    let currentUser = this.get('currentUser.user.email');
    if(!Ember.isEqual(owner, currentUser)){
      if(this.get('message.unread')){
        this.get('store').findRecord('message', this.get('message.id')).then(function(message){
          message.set('unread', false);
          message.save();
        });
      }
    }
  }
});
