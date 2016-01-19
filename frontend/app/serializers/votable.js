import DS from 'ember-data';

export default DS.JSONAPISerializer.extend({
  attrs: {
    votes: { serialize: false },
    evaluationValue:{ serialize: false }
  }
});
