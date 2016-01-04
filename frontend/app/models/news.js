import DS from 'ember-data';
import Ember from 'ember';
import Votable from './votable';

export default Votable.extend({
  name:       DS.attr('string'),
  body:       DS.attr('string'),
  createdAt:  DS.attr('date'),
  user:       DS.belongsTo('user')
});
