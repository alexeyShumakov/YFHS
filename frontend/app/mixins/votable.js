import Ember from 'ember';

export default Ember.Mixin.create({
  votes: DS.attr('number'),
  evaluationValue: DS.attr('number'),

  userIncreaseVote: Ember.computed('evaluationValue', function(){
    return this.get('evaluationValue') > 0;

  }),

  userDecreaseVote: Ember.computed('evaluationValue', function(){
    return this.get('evaluationValue') < 0;
  }),

  increaseVote(){
    $.post("/votes/increase", {
      id:     this.get('id'),
      object: this.get('constructor.modelName')
    });
  },
  decreaseVote(){
    $.post("/votes/decrease", {
      id:     this.get('id'),
      object: this.get('constructor.modelName')
    });
  }
});
