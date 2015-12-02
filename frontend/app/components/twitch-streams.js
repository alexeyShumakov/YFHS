import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['margin-bottom'],
  sliced: true,
  showMore: Ember.computed('streams', function(){
    return this.get('streams.length') > 5;
  }),

  sort: ['viewers:desc'],
  sortedStreams: Ember.computed.sort('streams', 'sort'),

  filterStreams: Ember.computed('streams', 'sliced', function(){
    let arr = this.get('sortedStreams');
    if (this.get('sliced')){
      return arr.slice(0, 5);
    } else {
      return arr;
    }
  }),

  actions:{
    showAll(){
      this.toggleProperty('sliced');
    }
  }
});
