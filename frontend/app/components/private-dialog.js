import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  message: '',
  preview: false,
  willInsertElement(){
    MessageBus.enableChunkedEncoding = false;
    MessageBus.start();

    MessageBus.callbackInterval = 100;
    console.log(this.get('model.id'));
    let _this = this;
    MessageBus.subscribe(`/dialogs/${this.get('model.id')}`, function(dmId){
      _this.get('store').query('dialogs-message',{
        filter: {id: dmId},
        include: 'message,message.user'
      }).then(function(dialogMessages){
        _this.get('model.dialogsMessages').pushObject(dialogMessages.get('firstObject'));
      })
    });
  },
  willDestroyElement(){
    MessageBus.unsubscribe(`/dialogs/${this.get('model.id')}`);
  },
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
