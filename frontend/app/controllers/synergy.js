import Ember from 'ember';

export default Ember.Controller.extend({
  canEdit: Ember.computed('model', function(){
    return this.get('currentUser').canEdit(this.get('model'));
  }),
  actions:{
    removeSynergy(){
      this.get('model').destroyRecord()
    }
  }
});
