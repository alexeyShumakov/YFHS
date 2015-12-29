import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  tagName: 'li',
  classNames: ['dropdown'],
  classNameBindings: ['open'],
  isAllDecks: false,
  open: false,

  mouseEnter(){
    Ember.run.cancel(this.get('hide'));
  },

  mouseLeave(){
    this.set('hide', Ember.run.later(this, this.hideDecks, 450));
  },

  moreDecks: Ember.computed(function() {
    let length = this.get('decks').get('length');
    return Ember.isPresent(this.get('decks')) && length >= 10;
  }),

  hideDecks(){
    this.set('isAllDecks', false);
    this.set('open', false);
  },

  actions: {
    removeDeck(deck){
      deck.destroyRecord()
    },

    showAll(){
      this.set('loading', true);
      let store = this.get('store');
      let _this = this;
      let params = {
        user_id: this.get('currentUser.user.id'),
        page: -1,
        include: 'player-class,deck-type'
      };
      store.query('deck', params).then(
        function(decks){
          _this.set('loading', false);
          _this.set('isAllDecks', true);
          _this.set('decks', decks);
        });
    },

    toggleOpen(){
      let store = this.get('store');
      let _this = this;
      let params = {
          user_id: this.get('currentUser.user.id'),
          limit: 10,
          include: 'player-class,deck-type'
      };
      store.query('deck', params).then(
        function(decks){
          _this.set('decks', decks);
          _this.toggleProperty('open');
        });
    }

  }


});
