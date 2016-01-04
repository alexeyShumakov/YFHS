import Ember from 'ember';

export default Ember.Controller.extend({
  canEdit: Ember.computed('model', function(){
    return this.get('currentUser').canEdit(this.get('model'));
  }),
  actions: {
    removeDeck(){
      this.get('model').destroyRecord();
    }
  }
});
