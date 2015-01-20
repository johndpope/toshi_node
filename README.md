# toshi for node.js

This library is a wrapper for the [toshi](https://toshi.io/) bitcoin node. 

### example
``` javascript
var toshi = require('toshi');
toshi = new toshi('https://bitcoin.toshi.io')

toshi.address.balance('1H1sq6Msgt9HjRrBuz8ieZdThzWXS6oPVA', function(err, res){
	console.log(res);
});
```

Which outputs:

```
{ hash: '1H1sq6Msgt9HjRrBuz8ieZdThzWXS6oPVA',
  balance: 848827043526,
  received: 4132683944039,
  sent: 3283856900513,
  unconfirmed_received: 0,
  unconfirmed_sent: 0,
  unconfirmed_balance: 0 }
```

When initiating the new toshi instance if no toshi url is provided then it will default to `https://bitcoin.toshi.io`. Also it's worth noting that this library will also work with litecoin. Try it out using `https://litecoin.toshi.io`. 

### lists

All list functions take an additional optional options parameter which has the fields `limit` and `offset`.

``` javascript
toshi.transaction.unconfirmed({limit: 1, offset: 2}, function(err, res){
	console.log(res);
});
```

### functions

Here is a link to the official [toshi documentation](https://toshi.io/docs/).

* address
  * balance(address, cb)
  * transactions(address, options, cb)
  * unspent_outputs(address, options, cb)
* block
  * paginate(options, cb)
  * get(hash, cb)
  * height(height, cb)
  * latest(cb)
  * transactions(hash, options, cb)
* transaction
  * get(hash, cb)
  * unconfirmed(options, cb)
  * broadcast(hex, cb)

### TODO

Add support for websockets and test out the broadcast function. 
