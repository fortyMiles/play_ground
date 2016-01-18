var _ = require('ramda');

var Container = function(x){
	this.__value = x;
};

Container.of = function(x) { return new Container(x); };

console.log(Container.of(3));

//(a -> b) -> Container a -> Container b
Container.prototype.map = function(f){
	return Container.of(f(this.__value));
};

Container.of(2).map(function(two){return two + 2;});
var length = Container.of('bombs').map(_.concat('away')).map(_.prop('length'));

console.log(length);
