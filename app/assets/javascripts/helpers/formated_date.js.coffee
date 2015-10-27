YFHS.FormatedDateHelper = Ember.Helper.helper (date)->
  moment(date).locale('ru').format('LL')
