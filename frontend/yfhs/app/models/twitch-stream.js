import DS from 'ember-data';

export default DS.Model.extend({
  streamerName: DS.attr('string'),
  avatar:       DS.attr('string'),
  viewers:      DS.attr('number'),
  online:       DS.attr('boolean')

});
