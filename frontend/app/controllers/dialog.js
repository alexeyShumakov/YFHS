import Ember from 'ember';

export default Ember.Controller.extend({
  store: Ember.inject.service(),
  message: '',
  preview: false,
  actions: {
    showTa(){
      this.set('preview', false);
    },
    showPre(){
      this.set('preview', true);
    },
    sendMessage(){
      if (Ember.isPresent(this.get('message'))){
        let _this =  this;
        let body = this.get('message');
        let message = this.get('store').createRecord('message', {
          body: body,
          user: this.get('currentUser.user'),
          target: this.get('model.company'),
          unread: true
        });
        message.save().then(function(message){
          _this.get('store').createRecord('dialogs-message',{
            dialog: _this.get('model'),
            message: message
          }).save().then(function(dm){
            _this.get('model.dialogsMessages').pushObject(dm);
            _this.set('message', '');
          });
        });
      }
    }
  }
});
