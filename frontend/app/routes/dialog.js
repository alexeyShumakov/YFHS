import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    let dialogsMessages = this.store.query('dialogs-message',{
      filter: {dialog: params.id},
      include: 'message,message.user,dialog',
      sort: '-createdAt',
      page: { limit: 10 }
    });
    let dialog = this.store.query('dialog', {filter:{id: params.id}, include: 'company'}).then(function(dialog){
      return dialog.get('firstObject');
    });
    return Ember.RSVP.hash({
      dialogsMessages: dialogsMessages,
      dialog: dialog
    });
  }
});
