YFHS.OnlineHelper = Ember.Helper.helper (date)->
  updatedTime = moment(date[0])
  if updatedTime > moment().subtract(10, 'minutes')
    'online'
  else
    if updatedTime > moment().subtract(1, 'day')
      "был в сети " + updatedTime.locale('ru').fromNow()
    else
      "был в сети " + updatedTime.locale('ru').format 'Do MMMM YYYY'
