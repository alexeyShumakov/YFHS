import Ember from 'ember';

export default Ember.Controller.extend({
  actions:{
    transitionToEntity(id, type){
      this.transitionToRoute(type, id);
    }
  }
});
