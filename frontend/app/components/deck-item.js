import Ember from 'ember';

export default Ember.Component.extend({
  loading: false,
  store: Ember.inject.service(),
  actions:{
    showDetails(){
      this.get('deck.cards');
      var _this = this;
      if (this.get('isDetailed')){
        this.toggleProperty('isDetailed');
      } else {
        this.set('loading', true);
        this.get('store').query('builder_card', {deck_id: this.get('deck.id'), include: 'card'}).then(
          function(){
            _this.set('loading', false);
            _this.toggleProperty('isDetailed');
          })
      }
    }
  }
});
