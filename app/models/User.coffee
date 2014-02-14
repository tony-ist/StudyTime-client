config = require 'config/config'
Backbone = require 'backbone'

module.exports = Backbone.Model.extend
  urlRoot: "#{config.apiUrl}/user"
  idAttribute: '_id'