import DS from 'ember-data';
import Votable from './votable';

export default Votable.extend({
  attrs: {
    createdAt: {serialize: false}
  }
});

