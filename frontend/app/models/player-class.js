import DS from 'ember-data';

export default DS.Model.extend({
  name:     DS.attr('string'),
  en_name:  DS.attr('string'),
  decks:    DS.hasMany('deck')

});
