import Ember from 'ember';

export default Ember.Controller.extend({
  store: Ember.inject.service(),
  message: '',
  preview: false,
  willDestroy(){
    this.set('message', '');
    this.set('preview', false);
  },
  actions: {
    showTa(){
      this.set('preview', false);
    },
    showPre(){
      this.set('preview', true);
    },
    sendMessage(){
      let body = this.get('message');
      let message = this.get('store').createRecord('message', {
        body: body,
        user: this.get('currentUser.user'),
        target: this.get('model'),
        unread: true
      });
      message.save();
    }
  }
});
