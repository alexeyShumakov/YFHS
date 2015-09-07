YFHS.OneBoxService = Ember.Service.extend
  CACHE: Ember.A()
  replaceLinks: ()->
    _cache = @.get 'CACHE'
    Ember.run.scheduleOnce 'afterRender', @, ()->
      $('.onebox-target').each ()->
        elem = $ @
        cacheElem = _cache.find (item)->
          if item.href == elem.attr('href')
            elem.replaceWith item.html
            return true

        if Ember.isEmpty cacheElem
          $.ajax('/one_box/show',
            dataType: 'html'
            data:
              url: elem.attr 'href'
            cache: true
          ).then(
            (html)->
              elem.replaceWith html
              _cache.addObject
                href: elem.attr 'href'
                html: html
            ()->
              _cache.addObject
                href: elem.attr 'href'
                html: elem.prop 'outerHTML'
          )
