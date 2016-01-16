import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  message: '',
  preview: false,
  willInsertElement(){
    MessageBus.enableChunkedEncoding = false;
    MessageBus.start();

    MessageBus.callbackInterval = 500;
    let _this = this;
    MessageBus.subscribe(`/dialogs/${this.get('model.id')}`, function(data){
      let dataJson = JSON.parse(data);
      if (Ember.isPresent(dataJson.dialogsMessageId)){
        _this.get('store').query('dialogs-message',{
          filter: {id: dataJson.dialogsMessageId},
          include: 'message,message.user'
        }).then(function(dialogMessages){
          _this.get('model.dialogsMessages').pushObject(dialogMessages.get('firstObject'));
        })
      } else if (Ember.isPresent(dataJson.checkedMessageId)){
        let checkedMessage = _this.get('store').peekRecord('message', dataJson.checkedMessageId);
        checkedMessage.set('unread', false);
      }
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
          _this.get('store').query('dialogs-message',{
            include: 'message,message.user',
            filter: {
              dialog: _this.get('model.id'),
              message: message.get('id')
            }
          }).then(function(dm){
            _this.get('model.dialogsMessages').pushObject(dm.get('firstObject'));
            _this.set('message', '');
          });
        });
      }
    }
  }
});
