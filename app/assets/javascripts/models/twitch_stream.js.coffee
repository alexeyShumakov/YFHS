# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.TwitchStream = DS.Model.extend
  streamerName: DS.attr 'string'
  avatar: DS.attr 'string'
  viewers: DS.attr 'number'
  online: DS.attr 'boolean'
