import Ember from 'ember';

export default Ember.Component.extend({
  isDetailed: false,
  actions:{
    showDetails(){
      this.toggleProperty('isDetailed');
    }

  }
});
