import DS from 'ember-data';
import Ember from 'ember';
import Votable from './votable';

export default Votable.extend({
  commentsCount:    DS.attr('number'),
  cardGameId:       DS.attr('string'),
  name:             DS.attr('string'),
  card_set:         DS.attr('string'),
  durability:       DS.attr('number'),
  card_type:        DS.attr('string'),
  race:             DS.attr('string'),
  player_class_str: DS.attr('string'),
  faction:          DS.attr('string'),
  rarity:           DS.attr('string'),
  cost:             DS.attr('number'),
  attack:           DS.attr('number'),
  health:           DS.attr('number'),
  text:             DS.attr('string'),
  flavor:           DS.attr('string'),
  artist:           DS.attr('string'),
  collectible:      DS.attr('boolean'),
  elite:            DS.attr('boolean'),
  img_url:          DS.attr('string'),
  mechanics:        DS.attr(),
  img_gold_url:     DS.attr('string'),

  builderCards:     DS.hasMany('builder_card'),
  synergiesCards:   DS.hasMany('synergies_card'),

  isLegendary: Ember.computed('rarity', function(){
    return Ember.isEqual(this.get('rarity'), 'Legendary');
  }),
  isActive: true

});
