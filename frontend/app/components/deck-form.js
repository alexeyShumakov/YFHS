import Ember from 'ember';

export default Ember.Component.extend({
  deckTypeId: null,

  didInsertElement(){
    this.get('deck.cards').forEach(function(bCard){
      bCard.disableCard();
    });
  },

  willDestroyElement(){
    this.get('deck.cards').forEach(function(bCard){
      bCard.enableCard();
    });
  },

  deckTypeItem: Ember.observer('deckTypeId', function(){
    let dTypes = this.get('deckTypes');
    let deckType = dTypes.findBy('id', this.get('deckTypeId'));
    this.set('deck.deckType', deckType);
    if (this.get('currentUser.isLogIn')){
      this.get('deck').save();
    }
  }),
  actions: {
    saveDeck(){
      if (this.get('currentUser.isLogIn')){
        this.get('deck').save();
      }
    },

    removeFromDeck(builderCard){
      let bCard = this.get('deck').removeCard(builderCard);
      if (this.get('currentUser.isLogIn')){
        if (Ember.isEqual(bCard.get('count'), 0)) {
          bCard.destroyRecord();
        } else {
          bCard.save();
        }
      }

    },

    addCardToDeck(card){
      var deck = this.get('deck');
      if (!deck.get('isWhole')){
        var currentBuilderCard = deck.get('cards').findBy('card.id', card.get('id'));
        if (Ember.isPresent(currentBuilderCard)){
          if (!card.get('isLegendary')){
            card.set('isActive', false);
            if (currentBuilderCard.get('count') < 2){
              currentBuilderCard.incrementProperty('count');
              if (this.get('currentUser.isLogIn')){
                currentBuilderCard.save()
              }
            }
          }
        } else {
          var bCard = deck.pushCard(card);
          if (this.get('currentUser.isLogIn')){ bCard.save() }
        }
      }
    }
  }
});
