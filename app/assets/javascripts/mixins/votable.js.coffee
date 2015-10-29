YFHS.Votable = Ember.Mixin.create
  votes: DS.attr 'number'
  evaluationValue: DS.attr 'number'
  userIncreaseVote: Ember.computed 'evaluationValue', ()->
    @get('evaluationValue') > 0

  userDecreaseVote: Ember.computed 'evaluationValue', ()->
    @get('evaluationValue') < 0

  increaseVote: ()->
    $.post "/votes/increase", {id: @get('id'), object:(@.get 'constructor.modelName')}
  decreaseVote: ()->
    $.post "/votes/decrease", {id: @get('id'), object:(@.get 'constructor.modelName')}
