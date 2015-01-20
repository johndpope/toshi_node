request = require 'request'

module.exports = class Req

	constructor: (url) ->

		@url = url

	get: (path, params, cb) ->

		if typeof params is 'function'
			cb = params
		else 
			if params['limit']? and params['offset']? 
				path += '?limit=' + params['limit'] + '&offset=' + params['offset']
			else if params['limit']?
				path += '?limit=' + params['limit']
			else if params['offset']? 
				path += '?offset=' + params['offset']
			else 
				return cb(new Error('bad params: options are limit and offset'))

		url = @url + path

		request { url: url, method: "GET", timeout: 15000}, (err, response, body)->
			
			if err || (response.statusCode != 200 && response.statusCode != 400)
				return cb new Error(err ? response.statusCode)
			
			try
				result = JSON.parse(body)
			catch error
				return cb(null, { messsage : body.toString() } )

			if result.message?
				return cb new Error(result.message)
			
			cb null, result

	post: (path, body, cb) ->

		url = @url + path

		request { url: url, method: "POST", timeout: 15000, body: body, json: true}, (err, response, body)->
			
			if err || (response.statusCode != 200 && response.statusCode != 400)
				return cb new Error(err ? response.statusCode)
			
			try
				result = JSON.parse(body)
			catch error
				return cb(null, { messsage : body.toString() } )

			if result.message?
				return cb new Error(result.message)
			
			cb null, result


