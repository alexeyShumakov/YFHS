import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  classNames: ['user-popup'],
  isShowPopup: false,
  showPopup(){
    this.set('isShowPopup', true);
  },
  hidePopup(){
    this.set('isShowPopup', false);
  },

  mouseEnter(){
    var _this = this;
    if (Ember.isBlank(this.get('decks'))){
      let params = {
        user_id: this.get('user.id'),
        limit: 3
      };
      this.get('store').query('deck', params).then(
        function (decks) {
          _this.set('decks', decks);
        });
    }
    let run = Ember.run;
    run.cancel(this.get('hide'));
    this.set('show', run.debounce(this, this.showPopup, 100));
  },
  mouseLeave(){
    let run = Ember.run;
    run.cancel(this.get('show'));
    this.set('hide', run.later(this, this.hidePopup, 450));
  }
});
