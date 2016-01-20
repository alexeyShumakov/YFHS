import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  message: '',
  preview: false,
  willInsertElement(){
    let _this = this;
    if (this.get('currentUser.isLogIn')){
      MessageBus.subscribe(`/dialogs/${this.get('model.dialog.id')}`, function(data){
        let dataJson = JSON.parse(data);
        if (Ember.isPresent(dataJson.dialogsMessageId)){
          _this.get('store').query('dialogs-message',{
            filter: {id: dataJson.dialogsMessageId},
            include: 'message,message.user'
          }).then(function(dialogMessages){
            _this.get('model.dialogsMessages').pushObjects(dialogMessages.get('content'));
          })
        } else if (Ember.isPresent(dataJson.checkedMessageId)){
          let checkedMessage = _this.get('store').peekRecord('message', dataJson.checkedMessageId);
          checkedMessage.set('unread', false);
        }
      });
    }
  },
  bindScrollDownMessageWindow(){
    let messagesWindow = $('.private-dialog__messages');
    messagesWindow.bind('DOMNodeInserted DOMNodeRemoved', function(event) {
      messagesWindow[0].scrollTop = messagesWindow[0].scrollHeight;
    });

  },
  scrollDownMessageWindow(){
    let messagesWindow = $('.private-dialog__messages');
    messagesWindow[0].scrollTop = messagesWindow[0].scrollHeight;
  },
  didInsertElement(){
    this.scrollDownMessageWindow();
    this.bindScrollDownMessageWindow();
  },
  willDestroyElement(){
    if (this.get('currentUser.isLogIn')){
      MessageBus.unsubscribe(`/dialogs/${this.get('model.dialog.id')}`);
    }
  },
  sortParam: ['createdAt'],
  sortedMessages: Ember.computed.sort( 'model.dialogsMessages', 'sortParam'),


  actions: {
    download(){
      let _this = this;

      let messagesWindow = $('.private-dialog__messages');
      messagesWindow.off('DOMNodeInserted DOMNodeRemoved');

      this.get('store').query('dialogs-message', {
        filter: {dialog: _this.get('model.dialog.id')},
        include: 'message,message.user',
        sort: '-createdAt',
        page: {
          limit: 10,
          offset: _this.get('model.dialogsMessages.length')
        }
      }).then(function(dialogsMessages){
        _this.get('model.dialogsMessages').pushObjects(dialogsMessages.get('content'));
        Ember.run.debounce(_this, _this.bindScrollDownMessageWindow, 500);
      })
    },
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
          target: this.get('model.dialog.company'),
          unread: true
        });
        message.save().then(function(message){
          _this.get('store').query('dialogs-message',{
            include: 'message,message.user',
            filter: {
              dialog: _this.get('model.dialog.id'),
              message: message.get('id')
            }
          }).then(function(dm){
            _this.get('model.dialogsMessages').pushObjects(dm.get('content'));
            _this.scrollDownMessageWindow();
            Ember.run.schedule("afterRender",_this,function() {
              this.scrollDownMessageWindow();
            });
            _this.set('message', '');
          });
        });
      }
    }
  }
});
