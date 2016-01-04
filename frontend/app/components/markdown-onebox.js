import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  oneBox: Ember.inject.service(),
  didInsertElement(){
    this.replaceCard();
    this.mentionTransition();
    this.cardTransition();
    if (this.get('placeholder')){
      this.get('oneBox').placeholder(this.getId());
    } else {
      this.get('oneBox').preview(this.getId());
    }
  },
  replaceCard(){
    var _this = this;
    var storeCards = this.get('store').peekAll('card');
    _this.$('span.game-card').each(function(){
      var $card = $(this);
      var storeCard = storeCards.find(function(card){
        return $card.html().toLowerCase() === card.get('name').toLowerCase();
      });
      if (Ember.isPresent(storeCard)) {
        $card.html(storeCard.get('name'));
        $card.addClass(storeCard.get('rarity'));
      } else {
        _this.get('store').query('card', {name: $card.html()}).then(
          function(cards){
            var c = cards.get('firstObject');
            if (Ember.isPresent(c)){
              if ($card.html().toLowerCase() === c.get('name').toLowerCase()) {
                $card.html(c.get('name'));
                $card.addClass(c.get('rarity'));
              }
            }
          });
      }
    });

  },
  cardTransition(){
    var _this = this;
    var storeCards = this.get('store').peekAll('card');
    this.$('span.game-card').on('click', function(a){
      a.preventDefault();
      var $card = $(this);
      var storeCard = storeCards.find(function(card){
        return $card.html().toLowerCase() === card.get('name').toLowerCase();
      });
      if (Ember.isPresent(storeCard)){
        _this.get('router').transitionTo('card', storeCard.get('id'));
      }
    });
  },

  mentionTransition(){
    Ember.run.scheduleOnce('afterRender', this, function() {
      var _this = this;
      this.$('a.mention').on('click', function(a){
        a.preventDefault();
        let user = $(this).html().replace(/@/, '');
        _this.get('router').transitionTo('user', user);
      });
    });
  },

  getId(){
    return `#${this.get('elementId')}`;
  },

  obs: Ember.observer('text', function(){
    Ember.run.scheduleOnce('afterRender', this, function() {
      this.replaceCard();
      this.mentionTransition();
    });
    if (this.get('placeholder')){
      this.get('oneBox').placeholder(this.getId());
    }
  })
});
