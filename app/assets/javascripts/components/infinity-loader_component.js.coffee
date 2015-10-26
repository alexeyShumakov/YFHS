# for more details see: http://emberjs.com/guides/components/

YFHS.InfinityLoaderComponent = Ember.Component.extend
  store: Ember.inject.service()
  nextPage: 2
  params: Ember.computed 'nextPage', ()->
    nextPage = @get 'nextPage'
    params = @get 'queryParams'
    if Ember.isBlank params
      params =
        page: nextPage
    params['page'] = nextPage
    params
  loading: false

  load: ()->
    _this = @
    model = @get 'model'
    total = @get 'model.meta.total'
    selfOffset = @$().offset().top
    scrollBottom = $(window).height() + $(window).scrollTop()
    unless @get 'loading'
      if selfOffset < scrollBottom
        if @get('nextPage') <= total
          _this.set 'loading', true
          @get('store').query(_this.get('modelName'), _this.get('params')).then(
            (newDecks)->
              model.pushObjects(newDecks.get 'content')
              _this.set 'loading', false
              _this.incrementProperty('nextPage')
          )
  didInsertElement: ()->
    _this= @
    $(window).on 'scroll', ()->
      Ember.run.debounce(_this, _this.load, 100)
  willDestroyElement: ()->
    $(window).off 'scroll'
