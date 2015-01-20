Addresses = require './modules/addresses'
Blocks = require './modules/blocks'
Transactions = require './modules/transactions'

class Toshi

	constructor: (url) ->

		url = if url? then url else 'https://bitcoin.toshi.io'
		@url = url += '/api/v0/'

		@address = new Addresses(@url)
		@block = new Blocks(@url)
		@transaction = new Transactions(@url)

module.exports = new Toshi()