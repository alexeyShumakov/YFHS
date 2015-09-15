# for more details see: http://emberjs.com/guides/components/

YFHS.LikeCompComponent = Ember.Component.extend
  classNames: ['likes']
  store: Ember.inject.service()
  isliked: false
  isShowUsers: false

  willInsertElement: ()->
    if @.get 'currentUser.isLogIn'
      userId = @.get 'currentUser.user.id'
      like = @.get('model.likes').findBy 'user.id', userId
      unless Ember.isEmpty like
        @.set 'isLiked', true
        @.set 'like', like

  mouseEnter: ()->
    @.set 'isShowUsers', true

  mouseLeave: ()->
    @.set 'isShowUsers', false


  click: ()->
    if @.get 'currentUser.isLogIn'
      like = @.get('like')
      if Ember.isEmpty like
        @.createLike()
      else
        @.destroyLike()


  destroyLike: ()->
    @.get('like').destroyRecord()
    @.set 'like', ''
    @.set 'isLiked', false

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
    )

