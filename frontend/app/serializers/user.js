import DS from 'ember-data';

export default DS.JSONAPISerializer.extend({
  attrs: {
    totalUnreadMessages:{ serialize: false }
  }
});
