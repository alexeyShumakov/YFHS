import DS from 'ember-data';

export default DS.Model.extend({
  votes: DS.attr('number'),
  evaluationValue: DS.attr('number'),

  userIncreaseVote: Ember.computed('evaluationValue', function(){
    return this.get('evaluationValue') > 0;

  }),

  userDecreaseVote: Ember.computed('evaluationValue', function(){
    return this.get('evaluationValue') < 0;
  }),

  increaseVote(){
    var _this = this;
    $.post("/votes/increase", {
      id:     this.get('id'),
      object: this.get('constructor.modelName')
    }).then(function(){
      _this.reload();
    });
  },
  decreaseVote(){
    var _this = this;
    $.post("/votes/decrease", {
      id:     this.get('id'),
      object: this.get('constructor.modelName')
    }).then(function(){
      _this.reload();
    });
  }
});
