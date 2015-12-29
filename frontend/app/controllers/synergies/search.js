import Ember from 'ember';

export default Ember.Controller.extend({
  queryParams: ['player_class', 'name'],
  player_class: null,
  name: null,

  clearProp(){
    this.setProperties({
      player_class: null,
      name: null
    })
  }
});
