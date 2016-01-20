import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  willInsertElement(){
    if (this.get('currentUser.isLogIn')) {
      let _this = this;
      let store = this.get('store');
      let model = this.get('model');
      MessageBus.subscribe(`/dialogs-list/${this.get('currentUser.user.id')}`, function(data){
        let dataJson = JSON.parse(data);
        let dialog = store.peekRecord('dialog', dataJson.id);
        if (Ember.isPresent(dialog)){
          dialog.reload();
        } else {
          store.query('dialog', {filter: {id: dataJson.id}}).then(function(dialogs){
            model.pushObjects(dialogs.get('content'));
          });
        }
      });
    }
  },

  willDestroyElement(){
    if (this.get('currentUser.isLogIn')){
      MessageBus.unsubscribe(`/dialogs-list/${this.get('currentUser.user.id')}`);
    }
  },
  actions: {
    removeDialog(dialog){
      dialog.destroyRecord();
    }
  }
});
