import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  isGold: false,
  didInsertElement(){
    var _this = this;
    var store = this.get('store');
    store.query('card', {random: true}).then(
      function(data){
        _this.set('card', data.get('firstObject'));
      });
  },

  actions:{
    toggleGold(){
      this.toggleProperty('isGold');
    }
  }
});
