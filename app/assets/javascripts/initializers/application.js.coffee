Ember.Application.initializer
  name: 'currentUserLoader'

  initialize: (container, application)->

    application.inject 'route', 'currentUser', 'service:current-user'
    application.inject 'controller', 'currentUser', 'service:current-user'
    application.inject 'component', 'currentUser', 'service:current-user'
    application.inject 'component', 'router', 'router:main'
