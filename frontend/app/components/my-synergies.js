import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  tagName: 'li',
  classNames: ['dropdown'],
  classNameBindings: ['open'],
  isAllSynergies: false,
  open: false,
  mouseEnter(){
    Ember.run.cancel(this.get('hide'));
  },
  mouseLeave(){
    this.set('hide', Ember.run.later(this, this.hideSynergies, 450));
  },
  moreSynergies: Ember.computed(function(){
    let length = this.get('synergies').get('length');
    return Ember.isPresent(this.get('synergies')) && length >= 10;

  }),
  hideSynergies(){
    this.set('isAllSynergies', false);
    this.set('open', false);
  },

  actions: {
    removeSynergy(synergy){
      synergy.destroyRecord()
    },

    showAll(){
      this.set('loading', true);
      let store = this.get('store');
      let _this = this;
      let params = {
        user_id: this.get('currentUser.user.id'),
        page: -1,
        include: 'player-class'
      };
      store.query('synergy', params).then(
        function(synergies){
          _this.set('loading', false);
          _this.set('isAllSynergies', true);
          _this.set('synergies', synergies);
        });
    },
    toggleOpen(){
      let store = this.get('store');
      let _this = this;
      let params = {
        user_id: this.get('currentUser.user.id'),
        limit: 10,
        include: 'player-class'
      };
      store.query('synergy', params).then(
        function(synergies){
          _this.set('synergies', synergies);
          _this.toggleProperty('open');
        })
    }
  }
});
