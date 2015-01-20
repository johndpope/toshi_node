toshi = require './toshi'

t = new toshi()

# t.address.balance '1J51vbMPiE79wKhY37xgZWpdYbVs6tWFaD', console.log
# t.address.transactions '1J51vbMPiE79wKhY37xgZWpdYbVs6tWFaD', {limit: 1, offset: 2}, console.log
# t.block.latest console.log

t.transaction.broadcast 'somebadhex', (err, res) =>
	res['messsage']
	console.log res

console.log 'hello world'