var _ = require('ramda');

var add = function(x, y){
    return x + y;
};

var increment = _.add(1);
var addTen = _.add(10);

debugger;

increment(2);
