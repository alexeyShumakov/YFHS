# for more details see: http://emberjs.com/guides/controllers/

YFHS.UserCommentsController = Ember.Controller.extend({
  actions:
    transitionToEntity: (id, type)->
      @transitionToRoute(type, id)

})

