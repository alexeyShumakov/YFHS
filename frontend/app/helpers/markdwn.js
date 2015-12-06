import Ember from 'ember';

export function markdwn(params/*, hash*/) {
  let html = markdown.toHTML(params[0]);
  return Ember.String.htmlSafe(html);
}

export default Ember.Helper.helper(markdwn);
