import Ember from 'ember';

export default Ember.Component.extend({
  some: 'some',
  store: Ember.inject.service(),
  currentPage: 1,
  cost: null,
  keyword: null,
  isLoading: false,

  search(){
    if (!this.get('isLoading')) {
      var _this = this;
      var params = this.get('qParams');
      this.set('isLoading', true);
      this.get('store').query('card', params).then(
        (cards)=> {
          _this.set('cards', cards);
          _this.set('isLoading', false);
        }
      )
    }
  },

  didInsertElement(){
    Ember.run.debounce(this, this.search, 100)
  },

  qParams: Ember.computed('currentPage', 'cost', 'keyword', 'playerClass', function(){
    var params = {
      page: this.get('currentPage'),
      cost: this.get('cost'),
      keyword: this.get('keyword'),
      player_class: this.get('playerClass'),
      current_player_class: this.get('currentPlayerClass')
    };
    return params;
  }),

  setCards: Ember.observer('keyword', 'currentPage', 'cost', 'playerClass', function(){
    Ember.run.debounce(this, this.search, 100);

  }),

  pageResetter: Ember.observer('keyword', 'cost', 'playerClass', function(){
    this.set('currentPage', 1);
  }),

  actions:{
    nextSlide(){
      console.log('hello!!');
      if(!(Ember.isEqual(this.get('cards.meta.total'), this.get('currentPage'))) ){
        this.incrementProperty('currentPage');
      }
    },
    prevSlide(){
      if (!(Ember.isEqual(this.get('currentPage'), 1 ))) {
        this.decrementProperty('currentPage');
      }
    },
    updateCost(value){
      this.set('cost', value);
    },
    updatePlayerClass(value){
      this.set('playerClass', value);
    },
    clickCard(card){
      this.sendAction('action', card);
    }
  }


});
