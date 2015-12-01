import Ember from 'ember';

export default Ember.Controller.extend({
  actions:{
    transitionToCard(card){
      this.transitionToRoute('card', card.get('id'));
    }
  }
});
