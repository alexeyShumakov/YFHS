import DS from 'ember-data';

export default DS.JSONAPISerializer.extend({
  attrs: {
    unreadCount: { serialize: false },
    createdAt: { serialize: false }
  }
});
