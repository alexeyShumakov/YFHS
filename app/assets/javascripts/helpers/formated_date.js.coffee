YFHS.FormatedDateHelper = Ember.Helper.helper (date)->
  moment(date[0]).locale('ru').fromNow()
