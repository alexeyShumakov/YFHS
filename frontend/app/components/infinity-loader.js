import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  nextPage: 2,
  loading: false,
  params: Ember.computed('nextPage', function(){
    var nextPage = this.get('nextPage');
    var params = this.get('queryParams');
    if (Ember.isBlank(params)) {
      params = { page: nextPage };
    }
    params['page'] = nextPage;
    return params;
  }),

  load(){
    var _this = this;
    var model = this.get('model');
    var total = this.get('model.meta.total-pages');
    var selfOffset = this.$().offset().top;
    var scrollBottom = this.$(window).height() + this.$(window).scrollTop();
    if (!(this.get('loading'))) {
      if (selfOffset < scrollBottom){
        if (this.get('nextPage') <= total){
          _this.set('loading', true);
          console.log(this.get('params'));
          this.get('store').query(_this.get('modelName'), _this.get('params')).then(
            function(newDecks){
              model.pushObjects(newDecks.get('content'));
              _this.set('loading', false);
              _this.incrementProperty('nextPage');
            })
        }
      }
    }

  },

  didInsertElement(){
    this.set('guid', Ember.guidFor(this));
    var _this= this;
    this.$(window).on("scroll.#{@get 'guid'}", function(){
      Ember.run.debounce(_this, _this.load, 100);
    });
  },
  willDestroyElement(){
    this.$(window).off("scroll.#{@get 'guid'}");
  }
});
