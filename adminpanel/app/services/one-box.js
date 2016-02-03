import Ember from 'ember';

export default Ember.Service.extend({
  CACHE: Ember.A(),
  preview(element){
    $(element).find('.onebox-target').each(function(){
      var elem = $(this);
      $.ajax('/one_box/show',
        {
          dataType: 'html',
          data:{
            url: elem.attr('href')
          },
          preview: false,
          cache: true
        }
      ).then(function(html){
          elem.replaceWith(html);
        }
      )

    });
  },
  placeholder(element){
    var _cache = this.get('CACHE');
    Ember.run.scheduleOnce('afterRender', this, function() {
      $(element).find('.onebox-target').each(function(){
        var elem = $(this);
        var cacheElem = _cache.find(function(item){
          if (item.href === elem.attr('href')){
            elem.replaceWith(item.html);
            return true;
          }
        });

        if (Ember.isEmpty(cacheElem)){
          $.ajax('/one_box/show',{
            dataType: 'html',
            data:{
              url: elem.attr('href'),
              preview: true
            },
            cache: true
          }).then(
            function(html){
              elem.replaceWith(html);
              _cache.addObject({
                href: elem.attr('href'),
                html: html
              });
            }, function(){
              _cache.addObject({
                href: elem.attr('href'),
                html: html
              });
            }
          );
        }
      });
    }, element);
  }
});

