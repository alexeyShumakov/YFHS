import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),

  pulse: Ember.computed.oneWay('_seconds').readOnly(),
  tick: Ember.observer('_seconds', function(){
    var clock = this;
    Ember.run.later(function () {
      var seconds = clock.get('_seconds');
      if (typeof seconds === 'number') {
        clock.set('_seconds', seconds + (1/4));
      }
    }, 250);
  }).on('init'),
  currentTime: Ember.computed('_seconds', function(){
    return moment(this.get('message.createdAt')).locale('ru').fromNow();
  }),
  _seconds: 0,


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
