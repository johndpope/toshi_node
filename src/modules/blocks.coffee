Request = require './request'

module.exports = class Block

	constructor: (url) ->

		@request = new Request(url)

	paginate: (params, cb) ->

		@request.get 'blocks', params, cb

	get: (hash, cb) ->

		@request.get 'blocks/' + hash, cb

	height: (height, cb) ->

		@request.get 'blocks/' + height, cb

	latest: (cb) ->

		@request.get 'blocks/latest', cb

	transactions: (hash, params, cb) ->

		@request.get 'blocks/' + hash + '/transactions', params, cb


