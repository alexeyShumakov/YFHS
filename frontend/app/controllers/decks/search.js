import Ember from 'ember';

export default Ember.Controller.extend({
  queryParams: ['player_class', 'deck_type', 'name'],
  player_class: null,
  deck_type: null,
  name: null,

  clearProp(){
    this.setProperties({
      player_class: null,
      deck_type: null,
      name: null
    });
  }
});
