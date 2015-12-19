var _ = require('ramda');

var curry = _.curry;
/*
var words = function(str){
    return _.split('', str);
};
*/

//var silice = undefined;

var slice = function(start, end, ary){
    return ary.slice(start, end);
};

var take = _.slice(0);

console.log(take(4, 'Something'));

var words = split('');
