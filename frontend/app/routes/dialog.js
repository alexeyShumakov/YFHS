import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    return this.store.query('dialog', {
      filter: {id: params.id},
      include: 'company,dialogs-messages,dialogs-messages.message,dialogs-messages.message.user'
    }).then(
      function(dialogs){
        return dialogs.get('firstObject');
      }
    )
  }
});
