Request = require './request'

module.exports = class Transaction

	constructor: (url) ->

		@request = new Request(url)

	get: (hash, cb) ->

		@request.get 'transactions/' + hash, cb

	unconfirmed: (params, cb) ->

		@request.get 'transactions/unconfirmed', params, cb

	# hex = A hex representation of the signed transaction.
	broadcast: (hex, cb) ->

		@request.post 'transactions', {hex: hex}, cb



