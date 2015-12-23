import DS from 'ember-data';
import Votable from './votable';

export default Votable.extend({
  commentable_id:   DS.attr('number'),
  commentable_type: DS.attr('string'),
  body:             DS.attr('string'),
  createdAt:        DS.attr('date'),
  targetName:       DS.attr('string'),

  user:             DS.belongsTo('user')

});
