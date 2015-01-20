Request = require './request'

module.exports = class Address

	constructor: (url) ->

		@request = new Request(url)

	balance: (address, cb) ->

		@request.get 'addresses/' + address, cb

	transactions: (address, params, cb) ->	

		path = 'addresses/' + address + '/transactions'
				
		@request.get path, params, cb		

	unspent_outputs: (address, params, cb) ->

		path = 'addresses/' + address + '/unspent_outputs'
				
		@request.get path, params, cb		


