YFHS.MarkdownHelper = Ember.Helper.helper((value)->
  converter = new showdown.Converter extensions: ['onebox']
  html = converter.makeHtml value
  return Ember.String.htmlSafe html
)