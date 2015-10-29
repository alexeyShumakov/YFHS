YFHS.Votable = Ember.Mixin.create
  increaseVote: ()->
    $.post "/votes/increase", {id: @get('id'), object:(@.get 'constructor.modelName')}
  decreaseVote: ()->
    $.post "/votes/decrease", {id: @get('id'), object:(@.get 'constructor.modelName')}
