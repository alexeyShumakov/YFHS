# For more information see: http://emberjs.com/guides/routing/

YFHS.UserCommentsRoute = Ember.Route.extend({
  beforeModel: (transition)->
    @set 'user_id', transition.params.user.id

  model: ()->
    @store.query 'comment', {user_id: @get('user_id')}

  setupController: (controller, model)->
    @_super controller, model
    params =
      user_id: @get 'user_id'
    controller.set 'params', params

})
