import Ember from 'ember';

export default Ember.Component.extend({
  actions:{
    removeCard(card){
      if (this.get('editable')){
        this.sendAction('action', card);
      } else {
        this.get('router').transitionTo('card', card.get('card.id'));
      }
    }
  }
});
