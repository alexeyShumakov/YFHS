# for more details see: http://emberjs.com/guides/components/

YFHS.MySynergiesComponent = Ember.Component.extend({
  store: Ember.inject.service()
  tagName: 'li'
  classNames: ['dropdown']
  classNameBindings: ['open']
  isAllSynergies: false
  open: false
  mouseEnter: ()->
    Ember.run.cancel(@get 'hide')
  mouseLeave: ()->
    @set 'hide', Ember.run.later(@, @hideSynergies, 450)
  moreSynergies: Ember.computed ()->
    length = @get('synergies').get 'length'
    if Ember.isBlank(@get('synergies')) or length < 10
      false
    else
      true
  hideSynergies: ()->
    @set 'isAllSynergies', false
    @set 'open', false

  actions:
    removeSynergy: (synergy)->
      synergy.destroyRecord()
    showAll: ()->
      @set 'loading', true
      store = @get 'store'
      _this = @
      params =
        user_id: @get('currentUser.user.id')
        page: -1
      store.query('synergy', params).then(
        (synergies)->
          _this.set 'loading', false
          _this.set 'isAllSynergies', true
          _this.set 'synergies', synergies
      )

    toggleOpen: ()->
      store = @get 'store'
      _this = @
      params =
        user_id: @get('currentUser.user.id')
        limit: 10
      store.query('synergy', params).then(
        (synergies)->
          _this.set 'synergies', synergies
          _this.toggleProperty 'open'
      )


})

