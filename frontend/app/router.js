import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('user', { path: 'users/:nickname' }, function() {
    this.route('decks');
    this.route('synergies');
    this.route('comments');
  });
  this.route('comments');
  this.route('synergies');

  this.route('cards');
  this.route('card', {path: 'cards/:id'});

  this.route('synergy', {path: 'synergies/:id'});
  this.route('synergy_edit', {path: 'synergies/:id/edit'});
  this.route('synergies', function(){
    this.route('search');
  });

  this.route('deck', {path: 'decks/:id'});
  this.route('deck_edit', {path: 'decks/:id/edit'});
  this.route('decks', function() {
    this.route('search');
  });

  this.route('builder', function() {
    this.route('deck', {path: 'deck/:id'});
    this.route('synergy', {path: 'synergy/:id'});
  });

  this.route('news', {path: 'news/:id'});
  this.route('news_index', {path: 'news'}, function(){
    this.route('new');
  });

  this.route('dialogs', {path: 'dialogs'});
  this.route('dialog', {path: 'dialog/:id'});

  this.route('guides', function() {
    this.route('guide', {path: ':id'});
    this.route('category', {path: 'category/:id'});
  });
});

export default Router;
