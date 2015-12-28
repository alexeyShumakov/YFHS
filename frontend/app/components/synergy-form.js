import Ember from 'ember';

export default Ember.Component.extend({
  didInsertElement(){
    this.get('synergy.cards').forEach(function(sCard){
      sCard.disableCard()
    });
  },
  willDestroyElement(){
    this.get('synergy.cards').forEach(function(sCard){
        sCard.enableCard()
      });
  },

  actions: {
    saveSynergy(){
      if (this.get('currentUser.isLogIn')){
        this.get('synergy').save();
      }
    },
    removeFromDeck(sCard){
      this.get('synergy').removeCard(sCard);

    },
    addCardToSynergy(card){
      var synergy = this.get('synergy');
      if (!synergy.get('isWhole')){
        let currentBuilderCard = synergy.get('cards').findBy('card.id', card.get('id'));
        if (Ember.isBlank(currentBuilderCard)){
          let sCard = synergy.pushCard(card);
          if (this.get('currentUser.isLogIn')){
            sCard.save()
          }
        }
      }
    }

  }


});
