import DS from 'ember-data';
import Votable from './votable';

export default Votable.extend({
  name: DS.attr('string'),
  body: DS.attr('string'),
  commentsCount:  DS.attr('number'),

  guideCategory: DS.belongsTo('guideCategory')
});
