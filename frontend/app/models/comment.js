import DS from 'ember-data';
import Votable from '../mixins/votable';

export default DS.Model.extend(Votable, {
  commentable_id:   DS.attr('number'),
  commentable_type: DS.attr('string'),
  body:             DS.attr('string'),
  createdAt:        DS.attr('date'),
  targetName:       DS.attr('string'),

  user:             DS.belongsTo('user')

});
