(function () {
  'use strict';

  var onebox = function () {
    return [
      {
        type:    'lang',
        regex:   /\b(((https?|ftp|dict):\/\/|www\.)[^'">\s]+\.[^'">\s]+)(?=\s|$)(?!["<>])/gi,
        replace: function (match, leadingSlash) {
          if (leadingSlash === '\\') {
            return match;
          } else {
                return '<a class="onebox-target" href="' + match+ '">' + match+ '</a>';
            }
          }
        }
    ];
  };
  if (typeof window !== 'undefined' && window.showdown && window.showdown.extensions) {
    window.showdown.extensions.onebox = onebox;
  }
  if (typeof module !== 'undefined') {
    module.exports = onebox;
  }

}());
