# for more details see: http://emberjs.com/guides/components/

YFHS.LikeCompComponent = Ember.Component.extend
  classNames: ['likes']
  store: Ember.inject.service()
  likesCount: Ember.computed 'model.likes', ()->
    @.get 'model.likes.length'

  sliceLikes: Ember.computed 'likesCount', ()->
    @.get('model.likes').toArray().reverse().slice(0, 5)

  isliked: false
  isShowUsers: false

  willInsertElement: ()->
    if @.get 'currentUser.isLogIn'
      userId = @.get 'currentUser.user.id'
      like = @.get('model.likes').findBy 'user.id', userId
      unless Ember.isBlank like
        @.set 'isLiked', true
        @.set 'like', like

  mouseEnter: ()->
    if Ember.isPresent @.get 'sliceLikes'
      @.set 'isShowUsers', true

  mouseLeave: ()->
    @.set 'isShowUsers', false

  destroyLike: ()->
    _this = @
    @.get('like').destroyRecord().then(
      ()->
        _this.set 'like', ''
        _this.set 'isLiked', false
        if Ember.isBlank _this.get 'sliceLikes'
          _this.set 'isShowUsers', false
    )

  createLike: ()->
    _this = @
    model = @.get 'model'
    modelName = model.get 'constructor.modelName'
    like = @.get('store').createRecord 'like'
    like.set 'user', @.get('currentUser.user')
    like.set modelName, model
    like.save().then(
      (like)->
        _this.set 'like', like
        _this.set 'isLiked', true
        _this.set 'isShowUsers', true
    )


  actions:
    toggleLike: ()->
      if @.get 'currentUser.isLogIn'
        like = @.get('like')
        if Ember.isBlank like
          @.createLike()
        else
          @.destroyLike()
